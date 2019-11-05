import numpy as np
import cv2
from skimage import morphology
from simple_pid import PID


def mask(img, lo, hi):
    img = cv2.GaussianBlur(img,(7, 7),0)
    mask = cv2.inRange(img, lo, hi)
    return cv2.bitwise_and(img, img, mask=mask)


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
    img_start = imgs[3]
    for img_start in imgs:

        CENTER = 397
        TOP = 699
        WIDTH = 47
        m = mask(img_start, (150, 150, 150), (255, 255, 255))
        m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
        m = cv2.dilate(m, kernel, iterations=10)
        m[m>0] = 255
        img = morphology.skeletonize(m//255)


        # # # new ###########################
        lefts, rights = [], []
        for height in range(50):
            for width in range(60):
                if img[TOP-height, CENTER-width]:
                    lefts.append(width)
                    break
            for width in range(60):
                if img[TOP-height, CENTER+width]:
                    rights.append(width)
                    break
        rights = []
        if lefts and rights:
            mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
        elif lefts:
            mid = CENTER - int(np.mean(lefts)) + WIDTH
        elif rights:
            mid = CENTER + int(np.mean(rights)) - WIDTH
        else:
            mid = False
        control = mid - CENTER
        # control = pid(control)/100.0
        control = control/50.0
        print("at:", mid)
        print("control:", control)
        img[670:690, mid] = True
        show(img_start, m, img)
    exit()

    whites = []
    for i in imgs:
        m = mask(i, (150, 150, 150), (255, 255, 255))
        m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
        m = cv2.dilate(m, kernel, iterations=20)
        m[m>0] = 255
        whites.append(m)

    # for w, img in zip(whites, imgs):
    #     show(morphology.skeletonize(w//255), w, img)

    thins = [morphology.skeletonize(w//255) for w in whites]

    CENTER = 397
    TOP = 699
    WIDTH = 47
    pid = PID(1, 0.1, 0.05, setpoint=CENTER)
    for img, orig in zip(thins, imgs):
        lefts, rights = [], []
        for height in range(50):
            for width in range(60):
                if img[TOP-height, CENTER-width]:
                    lefts.append(width)
                    break
            for width in range(60):
                if img[TOP-height, CENTER+width]:
                    rights.append(width)
                    break

        # rights = []
        if lefts and rights:
            mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
        elif lefts:
            mid = CENTER - int(np.mean(lefts)) + WIDTH
        elif rights:
            mid = CENTER + int(np.mean(rights)) - WIDTH
        else:
            mid = False

        control = pid(mid)
        print(CENTER-mid, control)
        orig = cv2.circle(orig, (mid, TOP-30), 5, (255, 0, 0), -1)

        show(orig, img)

    # for i, img in enumerate(thins):
    #     found = False
    #     for height in range(180):
    #         if img[699-height, 397]:
    #             print(f"found white at {height} in {i}")
    #             if height < 15:
    #                 print("start turning")
    #             found = True
    #             break
    #     if not found:
    #         continue
    #     for width in range(100):
    #         if img[699-height+5, 397+width]:
    #             print("turn left")
    #         if img[699-height+5, 397-width]:
    #             print("turn right")
    #     show(img)
