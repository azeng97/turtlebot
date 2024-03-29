import numpy as np
import cv2


def valid_contour(contour):
    if cv2.contourArea(contour) < 200:
        return False
    x, y, w, h = cv2.boundingRect(contour)
    ratio = float(w)/h
    if ratio > 1.3:
        return False
    if ratio < 0.5:
        return False
    return True


def get_cell_contours(img):
    contours = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)[1]
    return [cv2.convexHull(c) for c in contours if valid_contour(c)]


def get_centers(contours):
    centers = []
    for c in contours:
        x, y, w, h = cv2.boundingRect(c)
        centers.append((int(x + w/2), int(y + h/2)))
    return centers


def remove_small_contours(img):
    img = cv2.medianBlur(img, 3)
    mask = np.zeros(img.shape[:2], dtype="uint8")
    contours = get_cell_contours(img)
    for contour in contours:
        cv2.drawContours(mask, [contour], -1, 255, -1)
    return mask


def bounding_box(img):
    grey = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
    blur = cv2.medianBlur(grey, 7)
    blur[blur > 0] = 255
    return blur

def contours_from_mask(img):
    return get_cell_contours(bounding_box(img))


def contours_from_range(img, lo, hi):
    img = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)
    mask = cv2.inRange(img, lo, hi)
    half = cv2.bitwise_and(img, img, mask=mask)
    return contours_from_mask(half)


def find_beacon(top, bottom):
    """
    return: center pixel of top section if this beacon is in the view
    """
    for bottom_contour in bottom:
        for top_contour in top:
            bx, by, bw, bh = cv2.boundingRect(bottom_contour)
            tx, ty, tw, th = cv2.boundingRect(top_contour)
            if abs(bx - tx) > bw/2:
                continue
            if ty > by:
                continue
            if by - ty - th > bh/2:
                continue
            tx, ty = (int(tx + tw/2), int(ty + th/2)) # setting them to the middle
            return tx, ty

            tx , ty = int(tx*0.75), int(ty*0.75)
            return (ty, tx)

def contour_ranges(img):
    ranges = {}
    #RGB HSV: Pink
    pink_lowerHSV = (150, 80, 80)
    pink_upperHSV = (180, 210, 255)
    ranges["pink"] = contours_from_range(img, pink_lowerHSV, pink_upperHSV)

    #RGB HSV: Blue
    blue_lowerHSV = (84, 130, 55)
    blue_upperHSV = (110, 255, 255)
    ranges["blue"] = contours_from_range(img, blue_lowerHSV, blue_upperHSV)

    #RGB HSV: Green
    green_lowerHSV = (50, 100, 15)
    green_upperHSV = (83, 255, 150)
    ranges["green"] = contours_from_range(img, green_lowerHSV, green_upperHSV)

    #RGB HSV: Yellow:
    yellow_lowerHSV = (0, 120, 50)
    yellow_upperHSV = (30, 255, 255)
    ranges["yellow"] = contours_from_range(img, yellow_lowerHSV, yellow_upperHSV)

    return ranges

if __name__ == "__main__":
    from matplotlib import pyplot as plt
    def show(*images):
        if len(images) == 1 and type(images[0]) == list:
            images = images[0]
        cols = 3
        num_rows = (len(images) - 1) // cols + 1
        plt.rcParams['figure.figsize'] = [20, 7]
        for i, im in enumerate(images):
            plt.subplot(num_rows, cols, i+1)
            plt.xticks([]), plt.yticks([])
            plt.imshow(im, cmap='gray')
        plt.show()

    def draw_centers(centers, img):
        img = img.copy()
        for c in centers:
            cv2.circle(img, c, 10, (255, 0, 0), -1)
        return img


    imgs = [np.load(img) for img in ["curved_stop.npy", "curved_stop2.npy", "flat_stop.npy"]]
    # img = np.load("10.npy")
    img = imgs[2]

    ranges = {}
    #RGB HSV: Pink
    pink_lowerHSV = (150, 80, 80)
    pink_upperHSV = (180, 210, 255)
    ranges["pink"] = contours_from_range(img, pink_lowerHSV, pink_upperHSV)

    #RGB HSV: Blue
    blue_lowerHSV = (84, 130, 55)
    blue_upperHSV = (110, 255, 255)
    ranges["blue"] = contours_from_range(img, blue_lowerHSV, blue_upperHSV)

    #RGB HSV: Green
    green_lowerHSV = (50, 100, 15)
    green_upperHSV = (83, 255, 150)
    ranges["green"] = contours_from_range(img, green_lowerHSV, green_upperHSV)

    #RGB HSV: Yellow:
    yellow_lowerHSV = (0, 120, 50)
    yellow_upperHSV = (30, 255, 255)
    ranges["yellow"] = contours_from_range(img, yellow_lowerHSV, yellow_upperHSV)

    img = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)
    mask = cv2.inRange(img, pink_lowerHSV, pink_upperHSV)
    pink = cv2.bitwise_and(img, img, mask=mask)
    mask = cv2.inRange(img, blue_lowerHSV, blue_upperHSV)
    blue = cv2.bitwise_and(img, img, mask=mask)
    mask = cv2.inRange(img, green_lowerHSV, green_upperHSV)
    green = cv2.bitwise_and(img, img, mask=mask)
    mask = cv2.inRange(img, yellow_lowerHSV, yellow_upperHSV)
    yellow = cv2.bitwise_and(img, img, mask=mask)


    pinkgreen = find_beacon(ranges["pink"], ranges["green"])
    pinkyellow = find_beacon(ranges["pink"], ranges["yellow"])
    pinkblue = find_beacon(ranges["pink"], ranges["blue"])
    greenpink = find_beacon(ranges["green"], ranges["pink"])
    yellowpink = find_beacon(ranges["yellow"], ranges["pink"])
    bluepink = find_beacon(ranges["blue"], ranges["pink"])
    all = [pinkgreen, pinkyellow, pinkblue, greenpink, yellowpink, bluepink]
    for i, pos in enumerate(all):
        if pos:
            all[i] = int(pos[1]*4/3), int(pos[0]*4/3)

    # img = cv2.cvtColor(img, cv2.COLOR_HSV2RGB)
    # print(f"pinkgreen: {pinkgreen}, pinkyellow: {pinkyellow}, pinkblue: {pinkblue}\ngreenpink: {greenpink}, yellowpink: {yellowpink}, bluepink: {bluepink}")

    # print(len(contours_from_range(img, blue_lowerHSV, blue_upperHSV)))
    print(len([i for i in all if i]))
    show(pink, green, blue, yellow, draw_centers(all, cv2.cvtColor(img, cv2.COLOR_HSV2RGB)), img)
    # show(bounding_box(pink), bounding_box(green), bounding_box(blue), bounding_box(yellow), img, cv2.cvtColor(img, cv2.COLOR_HSV2RGB))
    # show(draw_centers(all, cv2.cvtColor(img, cv2.COLOR_HSV2RGB)))
