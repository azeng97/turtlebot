import numpy as np
import cv2
from matplotlib import pyplot as plt
# https://nikolasent.github.io/opencv/2017/05/07/Bird%27s-Eye-View-Transformation.html

if __name__ == "__main__":
    img = np.load("rect1.npy")

    '''plt.imshow(img, cmap='gray')
    plt.show()
    rows,cols,ch = img.shape
    IMAGE_H = 310
    IMAGE_W = 640
    src = np.float32([[0, IMAGE_H], [300, IMAGE_H], [0, 0], [IMAGE_W, 0]])
    dst = np.float32([[140, IMAGE_H], [350, IMAGE_H], [0, 0], [IMAGE_W, 0]])
    M = cv2.getPerspectiveTransform(src, dst) # The transformation matrix
    Minv = cv2.getPerspectiveTransform(dst, src) # Inverse transformation

    img = img[200:(200+IMAGE_H), 0:IMAGE_W] # Apply np slicing for ROI crop
    warped_img = cv2.warpPerspective(img, M, (IMAGE_W, IMAGE_H)) # Image warping
    plt.imshow(cv2.cvtColor(warped_img, cv2.COLOR_BGR2RGB)) # Show results
    plt.show()'''

    pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    pts2 = np.float32([[290,480],[350,480],[0,0],[640,0]])

#    pts1 = np.float32([[0,900],[800,900],[200,280],[600,280]])
#    pts2 = np.float32([[800,1400],[1000,1400],[400,400],[1400,400]])

    M = cv2.getPerspectiveTransform(pts1,pts2)

    dst = cv2.warpPerspective(img,M,(640,480))

    plt.subplot(121),plt.imshow(img),plt.title('Input')
    plt.subplot(122),plt.imshow(dst),plt.title('Output')
    plt.show()

    np.save("persp_trans", dst)
