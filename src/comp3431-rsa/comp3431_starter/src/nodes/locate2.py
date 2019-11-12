import numpy as np
import cv2
# from skimage import morphology
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


    imgs = [np.load(i) for i in glob("turn*.npy")]
    # img_start = imgs[3]
    for img_start in imgs:

        CENTER = 397
        TOP = 699
        WIDTH = 38
        m = mask(img_start, (150, 150, 150), (255, 255, 255))
        m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
        m = cv2.dilate(m, kernel, iterations=5)
        m[m>0] = 255
        img = m

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
        show(img_start, img)
