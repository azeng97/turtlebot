import numpy as np
import cv2
# from skimage import morphology
# from simple_pid import PID
from matplotlib import pyplot as plt
from glob import glob
from locate import contour_ranges, find_beacon


def mask(img, lo, hi):
    img = cv2.GaussianBlur(img,(7, 7),0)
    mask = cv2.inRange(img, lo, hi)
    return cv2.bitwise_and(img, img, mask=mask)


def show(*images, cols=3):
    if len(images) == 1 and type(images[0]) == list:
        images = images[0]
    cols = min(cols, len(images))
    num_rows = (len(images) - 1) // cols + 1
    plt.rcParams['figure.figsize'] = [20, 7]
    for i, im in enumerate(images):
        plt.subplot(num_rows, cols, i+1)
        plt.xticks([]), plt.yticks([])
        plt.imshow(im, cmap='gray')
    plt.show()

def valid_rect(contour):
    if len(contour) < 2:
        return False
    if cv2.contourArea(contour) < 1:
        return False
    if cv2.contourArea(contour)/cv2.contourArea(cv2.convexHull(contour)) < 0.8:
        return False
    (x,y), (width, height), angle = cv2.minAreaRect(contour)
    ratio = width/height
    if 0.7 < ratio < 1.3:
        return False
    return True

def get_rect_contours(img):
    contours = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)[1]
    return [c for c in contours if valid_rect(c)]

def get_not_rect_contours(img):
    contours = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)[1]
    return [c for c in contours if valid_rect(c)]

def thin(img):
    size = np.size(img)
    skel = np.zeros(img.shape,np.uint8)

    ret,img = cv2.threshold(img,127,255,0)
    element = cv2.getStructuringElement(cv2.MORPH_CROSS,(3,3))
    done = False

    while( not done):
        eroded = cv2.erode(img,element)
        temp = cv2.dilate(eroded,element)
        temp = cv2.subtract(img,temp)
        skel = cv2.bitwise_or(skel,temp)
        img = eroded.copy()

        zeros = size - cv2.countNonZero(img)
        if zeros==size:
            done = True
    return skel

def contours_as_img(img):
    img = cv2.medianBlur(img, 3)
    mask = np.zeros(img.shape[:2], dtype="uint8")
    contours = get_rect_contours(img)
    for contour in contours:
        (x,y), (width, height), angle = cv2.minAreaRect(contour)
        if width < height:
            width, height = height, width
            angle += 90
        contour = np.int0(cv2.boxPoints(((x, y), (width, height), angle)))
        cv2.drawContours(mask, [contour], -1, 255, -1)
    return mask

def flatern_rectangles(img):
    img = cv2.medianBlur(img, 5)
    mask = np.zeros(img.shape[:2], dtype="uint8")
    contours = get_rect_contours(img)
    for contour in contours:
        (x,y), (width, height), angle = cv2.minAreaRect(contour)
        if width < height:
            width, height = height, width
            angle += 90
        width += 45
        height = 0.5
        contour = np.int0(cv2.boxPoints(((x, y), (width, height), angle)))
        cv2.drawContours(mask, [contour], -1, 255, -1)
    return mask

def persp_trans(img):
    pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    pts2 = np.float32([[360,700],[450,700],[0,0],[640,380]])
    M = cv2.getPerspectiveTransform(pts1,pts2)
    return cv2.warpPerspective(img,M,(640,700))

def red_light(ranges):
    return (find_beacon(ranges["pink"], ranges["green"]) or find_beacon(ranges["pink"], ranges["yellow"]) or find_beacon(ranges["pink"], ranges["blue"])) != None

def green_light(ranges):
    return (find_beacon(ranges["green"], ranges["pink"]) or find_beacon(ranges["yellow"], ranges["pink"]) or find_beacon(ranges["blue"], ranges["pink"])) != None


# imgs = [np.load(img) for img in ["curved_stop.npy", "curved_stop2.npy", "flat_stop.npy", "stop_now.npy"]]

# for img in imgs:
#     ranges = contour_ranges(img)
#     go = green_light(ranges)
#     stop = red_light(ranges)

#     print(stop, go)

def get_processed_img(img):
    img = persp_trans(img)
    m = mask(img, (150, 150, 150), (255, 255, 255))
    m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
    # m = cv2.dilate(m, kernel, iterations=5)
    m = cv2.erode(m, kernel, iterations=2)
    m[m>0] = 255
    return cv2.bitwise_or(thin(m), flatern_rectangles(m))

if __name__ == "__main__":
    for img in [np.load(i) for i in glob("rect*.npy")]:
        show(get_processed_img(img))
    exit()



    imgs = [persp_trans(np.load(i)) for i in glob("shoul*.npy")]
    img_start = imgs[-1]
    for img_start in imgs:

        # img_start[625:] = 0
        CENTER = 397
        TOP = 699
        TOP = 625
        WIDTH = 38
        m = mask(img_start, (150, 150, 150), (255, 255, 255))
        m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
        # m = cv2.dilate(m, kernel, iterations=5)
        m = cv2.erode(m, kernel, iterations=2)
        m[m>0] = 255
        img = m

        show(img, thin(img), cv2.bitwise_or(thin(img), flatern_rectangles(img)))
        continue

        # img = np.flip(img, 1)
        # CENTER = 240

        if img[TOP, CENTER]:
            left_count = 0
            right_count = 0
            for height in range(20):
                for width in range(50):
                    if img[TOP-height, CENTER-width]:
                        left_count += 1
                    if img[TOP-height, CENTER+width]:
                        right_count += 1
            if left_count / right_count > 5:
                print("TURN LEFT NOW!!!!")
            if right_count / left_count > 5:
                print("TURN RIGHT NOW!!!!")



        # # # new ###########################
        lefts, rights = [], []
        for height in range(50):
        # for height in range(80, 80+50):
            for width in range(100):
                if img[TOP-height, CENTER-width]:
                    lefts.append(width)
                    break
            for width in range(100):
                if img[TOP-height, CENTER+width]:
                    rights.append(width)
                    break
        # rights = []
        if lefts and rights:
            print("both")
            print(len(lefts), len(rights))
            mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
        elif lefts:
            print("lefts")
            mid = CENTER - int(np.mean(lefts)) + WIDTH
        elif rights:
            print("rights")
            mid = CENTER + int(np.mean(rights)) - WIDTH
        else:
            mid = False
        control = mid - CENTER
        # control = pid(control)/100.0
        control = control/100.0
        print("at:", mid)
        print("control:", control)
        if control > 0:
            print("turn left")
        else:
            print("turn right")
        # img[699-50-80:699-80, mid] = 255
        # img[699-50-80:699-80, CENTER] = 255
        img[699-50:699, mid] = 255
        img[699-50:699, CENTER] = 255
        # skel2 = morphology.skeletonize(img.astype(np.bool))
        show(img, contours_as_img(img), flatern_rectangles(img))
        # break
