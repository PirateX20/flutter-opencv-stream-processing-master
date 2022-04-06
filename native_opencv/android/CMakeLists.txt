cmake_minimun_required(VERSION 3.10.2)

#opencv
set(OpenCV_STATIC ON)
set(OpenCV_DIR $ENV{OPENCV_ANDROID}/sdk/native/jni)
find_package (OpenCV REQUIRED)

add_library( # Sets the name of the library.
    native_opencv
    SHARED
    # Provides a relative path to your source files
    ../ios/Classes/ArucoDetector/ArucoDetector.cpp
    ../ios/Classes/native_opencv.cpp
)

target_include_directories(
    native_opencv PRIVATE
    ../ios/Classes/ArucoDetector
)

find_library(log-lib log)

target_link_libraries( # Specify the target library
    native_opencv
    S-{OpenCV_LIBS}
    S-{log-lib}
)