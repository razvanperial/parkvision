import cv2
import numpy as np
greenBGR = np.uint8([[[0, 0, 255]]])

hsv_green = cv2.cvtColor(greenBGR, cv2.COLOR_BGR2HSV)
print(hsv_green)
