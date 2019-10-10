import numpy as np
import cv2


def show(*images):
    cols = 3
    num_rows = (len(images) - 1) // cols + 1
    plt.rcParams['figure.figsize'] = [20, 7 * num_rows]
    for i, im in enumerate(images):
        plt.subplot(num_rows, cols, i+1)
        plt.xticks([]), plt.yticks([])
        plt.imshow(im, cmap='gray')
    plt.show()
    plt.rcParams['figure.figsize'] = [20, 10]


def valid_contour(contour):
    if cv2.contourArea(contour) < 5000:
        return False
    x, y, w, h = cv2.boundingRect(contour)
    ratio = float(w)/h
    if ratio > 1.1:
        return False
    if ratio < 0.65:
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


def draw_centers(centers, img):
    img = img.copy()
    for c in centers:
        cv2.circle(img, c, 10, (0, 0, 0), -1)
    return img


def centers_from_mask(img):
    grey = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    blur = cv2.medianBlur(grey, 7)
    blur[blur > 0] = 255
    contours = get_cell_contours(blur)
    return get_centers(contours)


def centers_from_range(img, lo, hi):
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    mask = cv2.inRange(img, lo, hi)
    half = cv2.bitwise_and(img, img, mask=mask)
    #cv2.imshow("half", half)
    # cv2.waitKey(0)
    return centers_from_mask(half)


def find_beacon(top, bottom):
    """
    return: center pixel of top section if this beacon is in the view
    """
    for (xb, yb) in bottom:
        for (xt, yt) in top:
            if abs(xb - xt) < 15 and yt < yb:
                xt, yt = int(xt*0.75), int(yt*0.75)
                return (yt, xt)


if __name__ == "__main__":
    from matplotlib import pyplot as plt
    ranges = {
        "pink": ((140, 40, 70), (255, 130, 200)),
        "blue": ((0, 70, 100), (50, 170, 200)),
        "green": ((0, 60, 40), (50, 130, 110)),
        "fake": ((0, 60, 40), (10, 70, 50)),
    }

    img = np.load("unfiltered.npy")
    pinks = centers_from_range(img, *ranges["pink"])
    blues = centers_from_range(img, *ranges["blue"])
    greens = centers_from_range(img, *ranges["green"])
    yellows = centers_from_range(img, *ranges["fake"])

    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    beacon0 = find_beacon(pinks, greens)
    beacon1 = find_beacon(blues, pinks)
    beacon2 = find_beacon(pinks, yellows)
    beacon3 = find_beacon(yellows, pinks)

    print(pinks, blues, greens, yellows)
    print(beacon0, beacon1, beacon2, beacon3)
    show(draw_centers([beacon0, beacon1, beacon2, beacon3], img))
    # show(draw_centers(pinks, img), draw_centers(blues, img), draw_centers(greens, img))
