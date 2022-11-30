from unicodedata import numeric
import cv2 as cv
import numpy as np


def vision_compute():
    number_parking = 8
    final_value = 0
# opening img
    img = cv.imread("Case2.jpg")
# resize img
    scale_percent = 25  # percent of original size
    width = int(img.shape[1] * scale_percent / 100)
    height = int(img.shape[0] * scale_percent / 100)
    dim = (width, height)
    img = cv.resize(img, dim)
# gray image
    gray_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    _, thrash = cv.threshold(gray_img, 240, 255, cv.THRESH_BINARY_INV)
    contours, _ = cv.findContours(
        thrash, cv.RETR_TREE, cv.CHAIN_APPROX_NONE)
    if (int(len(contours)) == number_parking):
        final_value = number_parking
    else:
        final_value = int(number_parking-(len(contours)/2 - number_parking))

    return final_value
