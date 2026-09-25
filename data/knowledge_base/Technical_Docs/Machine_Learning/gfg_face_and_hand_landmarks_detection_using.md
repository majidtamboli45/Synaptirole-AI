# Face and Hand Landmarks Detection using Python

> Source: https://www.geeksforgeeks.org/machine-learning/face-and-hand-landmarks-detection-using-python-mediapipe-opencv/

In this article, we will use mediapipe python library to detect face and hand landmarks. We will be using a Holistic model from mediapipe solutions to detect all the face and hand landmarks. We will be also seeing how we can access different landmarks of the face and hands which can be used for different computer vision applications such as sign language detection, drowsiness detection, etc.
Required Libraries
- Mediapipe is a cross-platform library developed by Google that provides amazing ready-to-use ML solutions for computer vision tasks.
- OpenCV library in python is a computer vision library that is widely used for image analysis, image processing, detection, recognition, etc.
Installing required libraries
pip install opencv-python mediapipe msvc-runtime
Below is the step-wise approach for Face and Hand landmarks detection
STEP-1: Import all the necessary libraries, In our case only two libraries are required.
# Import Libraries
import cv2
import time
import mediapipe as mp
STEP-2: Initializing Holistic model and Drawing utils for detecting and drawing landmarks on the image.
# Grabbing the Holistic Model from Mediapipe and
# Initializing the Model
mp_holistic = mp.solutions.holistic
holistic_model = mp_holistic.Holistic(
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5
)
# Initializing the drawing utils for drawing the facial landmarks on image
mp_drawing = mp.solutions.drawing_utils
Let us look into the parameters for the Holistic Model:
Holistic(
  static_image_mode=False, 
  model_complexity=1, 
  smooth_landmarks=True, 
  min_detection_confidence=0.5, 
  min_tracking_confidence=0.5
)
- static_image_mode: It is used to specify whether the input images must be treated as static images or as a video stream. The default value is False.
- model_complexity: It is used to specify the complexity of the pose landmark model: 0, 1, or 2. As the model complexity of the model increases the landmark accuracy and latency increase. The default value is 1.
- smooth_landmarks: This parameter is used to reduce the jitter in the prediction by filtering pose landmarks across different input images. The default value is True.
- min_detection_confidence: It is used to specify the minimum confidence value with which the detection from the person-detection model needs to be considered as successful. Can specify a value in [0.0,1.0]. The default value is 0.5.
- min_tracking_confidence: It is used to specify the minimum confidence value with which the detection from the landmark-tracking model must be considered as successful. Can specify a value in [0.0,1.0]. The default value is 0.5.
STEP-3: Detecting Face and Hand landmarks from the image. Holistic model processes the image and produces landmarks for Face, Left Hand, Right Hand and also detects the Pose of the
- Capture the frames continuously from the camera using OpenCV.
- Convert the BGR image to an RGB image and make predictions using initialized holistic model.
- The predictions made by the holistic model are saved in the results variable from which we can access the landmarks using results.face_landmarks, results.right_hand_landmarks, results.left_hand_landmarks respectively.
- Draw the detected landmarks on the image using the draw_landmarks function from drawing utils.
- Display the resulting Image.
# (0) in VideoCapture is used to connect to your computer's default camera
capture = cv2.VideoCapture(0)
# Initializing current time and precious time for calculating the FPS
previousTime = 0
currentTime = 0
while capture.isOpened():
    # capture frame by frame
    ret, frame = capture.read()
    # resizing the frame for better view
    frame = cv2.resize(frame, (800, 600))
    # Converting the from BGR to RGB
    image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    # Making predictions using holistic model
    # To improve performance, optionally mark the image as not writeable to
    # pass by reference.
    image.flags.writeable = False
    results = holistic_model.process(image)
    image.flags.writeable = True
    # Converting back the RGB image to BGR
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    # Drawing the Facial Landmarks
    mp_drawing.draw_landmarks(
      image,
      results.face_landmarks,
      mp_holistic.FACEMESH_CONTOURS,
      mp_drawing.DrawingSpec(
        color=(255,0,255),
        thickness=1,
        circle_radius=1
      ),
      mp_drawing.DrawingSpec(
        color=(0,255,255),
        thickness=1,
        circle_radius=1
      )
    )
    # Drawing Right hand Land Marks
    mp_drawing.draw_landmarks(
      image, 
      results.right_hand_landmarks, 
      mp_holistic.HAND_CONNECTIONS
    )
    # Drawing Left hand Land Marks
    mp_drawing.draw_landmarks(
      image, 
      results.left_hand_landmarks, 
      mp_holistic.HAND_CONNECTIONS
    )
    
    # Calculating the FPS
    currentTime = time.time()
    fps = 1 / (currentTime-previousTime)
    previousTime = currentTime
    
    # Displaying FPS on the image
    cv2.putText(image, str(int(fps))+" FPS", (10, 70), cv2.FONT_HERSHEY_COMPLEX, 1, (0,255,0), 2)
    # Display the resulting image
    cv2.imshow("Facial and Hand Landmarks", image)
    # Enter key 'q' to break the loop
    if cv2.waitKey(5) & 0xFF == ord('q'):
        break
# When all the process is done
# Release the capture and destroy all windows
capture.release()
cv2.destroyAllWindows()
The holistic model produces 468 Face landmarks, 21 Left-Hand landmarks, and 21 Right-Hand landmarks. The individual landmarks can be accessed by specifying the index of the required landmark. Example: results.left_hand_landmarks.landmark[0]. You can get the index of all the individual landmarks using the below code:
# Code to access landmarks
for landmark in mp_holistic.HandLandmark:
    print(landmark, landmark.value)
print(mp_holistic.HandLandmark.WRIST.value)
HandLandmark.WRIST 0
HandLandmark.THUMB_CMC 1
HandLandmark.THUMB_MCP 2
HandLandmark.THUMB_IP 3
HandLandmark.THUMB_TIP 4
HandLandmark.INDEX_FINGER_MCP 5
HandLandmark.INDEX_FINGER_PIP 6
HandLandmark.INDEX_FINGER_DIP 7
HandLandmark.INDEX_FINGER_TIP 8
HandLandmark.MIDDLE_FINGER_MCP 9
HandLandmark.MIDDLE_FINGER_PIP 10
HandLandmark.MIDDLE_FINGER_DIP 11
HandLandmark.MIDDLE_FINGER_TIP 12
HandLandmark.RING_FINGER_MCP 13
HandLandmark.RING_FINGER_PIP 14
HandLandmark.RING_FINGER_DIP 15
HandLandmark.RING_FINGER_TIP 16
HandLandmark.PINKY_MCP 17
HandLandmark.PINKY_PIP 18
HandLandmark.PINKY_DIP 19
HandLandmark.PINKY_TIP 20
0
OUTPUT:
