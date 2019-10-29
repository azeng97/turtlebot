import numpy as np
import cv2
from skimage import morphology


def mask(img, lo, hi):
    img = cv2.GaussianBlur(img,(7, 7),0)
    mask = cv2.inRange(img, lo, hi)
    return cv2.bitwise_and(img, img, mask=mask)


def remove_background(img, green):
    blur = cv2.medianBlur(green, 5)
    blur[blur > 0] = 255
    contours = cv2.findContours(blur, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)[1]
    contours = [cv2.convexHull(c) for c in contours if cv2.contourArea(c) > 5000]
    mask = np.zeros(img.shape[:2], dtype="uint8")
    for contour in contours:
        cv2.drawContours(mask, [contour], -1, 255, -1)
    higest = 300
    for c in contours:
        x, y, w, h = cv2.boundingRect(c)
        higest = min(y, higest)

    img[:higest, :] = 0
    return img

if __name__ == "__main__":
    from matplotlib import pyplot as plt
    from glob import glob
    def show(*images):
        cols = 3
        num_rows = (len(images) - 1) // cols + 1
        plt.rcParams['figure.figsize'] = [20, 7]
        for i, im in enumerate(images):
            plt.subplot(num_rows, cols, i+1)
            plt.xticks([]), plt.yticks([])
            plt.imshow(im, cmap='gray')
        plt.show()


    imgs = [np.load(i) for i in glob("persp_trans*.npy")]
    img = imgs[0]

    green_lowerHSV = (30, 50, 15)
    green_upperHSV = (50, 140, 255)
    greens = []
    for i in imgs:
        i = cv2.cvtColor(i, cv2.COLOR_RGB2HSV)
        m = mask(i, green_lowerHSV, green_upperHSV)
        m = cv2.cvtColor(m, cv2.COLOR_HSV2RGB)
        m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        m[m>0] = 255
        greens.append(m)
    imgs = [remove_background(img, green) for img, green in zip(imgs, greens)]

    whites = []
    for i in imgs:
        m = mask(i, (150, 150, 150), (255, 255, 255))
        m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
        m = cv2.dilate(m, kernel, iterations=11)
        m[m>0] = 255
        whites.append(m)

    # for w, img in zip(whites, imgs):
    #     show(morphology.skeletonize(w//255), w, img)

    thins = [morphology.skeletonize(w//255) for w in whites]


    for i, img in enumerate(thins):
        found = False
        for height in range(180):
            if img[699-height, 397]:
                print(f"found white at {height} in {i}")
                if height < 15:
                    print("start turning")
                found = True
                break
        if not found:
            continue
        for width in range(100):
            if img[699-height+5, 397+width]:
                print("turn left")
            if img[699-height+5, 397-width]:
                print("turn right")
        show(img)
