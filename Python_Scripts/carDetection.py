import numpy as np
import cv2 as cv
import time

# YOLO imports
net = cv.dnn.readNetFromDarknet('yolov3.cfg', 'yolov3.weights')
net.setPreferableBackend(cv.dnn.DNN_BACKEND_OPENCV)
ln = net.getLayerNames()
classes = []
with open('coco.names', 'r') as f:
    classes = f.read().splitlines()

colors = np.random.uniform(0, 255, size=(100, 3))
font = cv.FONT_HERSHEY_PLAIN

# initialize the webcam
cap = cv.VideoCapture(0)
if not cap.isOpened():
    raise IOError("Cannot open webcam")
counter = 0
# construct the blob
while True:
    ret, frame = cap.read()
    height, width, _ = frame.shape
    blob = cv.dnn.blobFromImage(
        frame, 1/255.0, (416, 416), swapRB=True, crop=False)

    net.setInput(blob)

    output_layers_names = net.getUnconnectedOutLayersNames()
    layersOutputs = net.forward(output_layers_names)
    boxes = []
    confidences = []
    class_ids = []

    for outputs in layersOutputs:
        for detection in outputs:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            if confidence > 0.2:
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2]*width)
                h = int(detection[3]*height)

                x = int(center_x - w/2)
                y = int(center_y - h/2)

                boxes.append([x, y, w, h])
                confidences.append((float(confidence)))
                class_ids.append(class_id)

    indexes = cv.dnn.NMSBoxes(boxes, confidences, 0.2, 0.4)

    if len(indexes) > 0:
        for i in indexes.flatten():
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])
            if (label == "car"):
                counter = counter+1
                confidence = str(round(confidences[i], 2))
                color = colors[i]
                cv.rectangle(frame, (x, y), (x+w, y+h), color, 2)
                cv.putText(frame, label + " " + confidence,
                           (x, y+20), font, 2, (255, 255, 255), 2)
    cv.imshow('Image', frame)

    counter = 0
    c = cv.waitKey(1)
    if c == 27:
        break

cap.release()
cv.destroyAllWindows()
