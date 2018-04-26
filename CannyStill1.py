import cv2
import numpy as np
import os

def main():
    imgOriginal=cv2.imread('image.jpg')

    if imgOriginal is None:
        print "error: image not read from file \n\n"
        os.system("pause")
        return
    imgGrayScale=cv2.cvtColor(imgOriginal,cv2.COLOR_BGR2GRAY)

    imgBlurred=cv2.GaussianBlur(imgGrayScale,(5,5),0)

    imgCanny=cv2.Canny(imgBlurred,100,200);

    cv2.namedWindow("imgOriginal",cv2.WINDOW_AUTOSIZE)

    cv2.namedWindow("imgCanny",cv2.WINDOW_AUTOSIZE)

    cv2.imshow("imgOriginal",imgOriginal)

    cv2.imshow("imgCanny",imgCanny);

    cv2.waitKey()

    cv2.destoryAllWindows()

    return

if __name__=="__main__":
    main()
