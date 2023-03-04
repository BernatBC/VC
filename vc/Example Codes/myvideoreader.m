% Create a cascade detector object.
Detector = vision.CascadeObjectDetector('FrontalFaceLBP');
 
% Read a video frame and run the face detector.
videoReader = VideoReader('I:/vc/sample images/face 1.mp4');
 
while hasFrame(videoReader)
    % get the next frame
    videoFrame = readFrame(videoReader);
    bbox = step(Detector, videoFrame);
 
    % Draw the returned bounding box around the detected face.
    videoFrame = insertShape(videoFrame, 'Rectangle', bbox,'LineWidth',5);
    imshow(videoFrame);
end
