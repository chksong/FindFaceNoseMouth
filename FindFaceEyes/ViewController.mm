//
//  ViewController.m
//  FindFaceEyes
//
//  Created by chksong on 15/8/17.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

const int HaarOptions = CV_HAAR_FIND_BIGGEST_OBJECT | CV_HAAR_DO_ROUGH_SEARCH;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
    videoCamera.defaultAVCaptureDevicePosition =  AVCaptureDevicePositionFront ;
    videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288 ;
    videoCamera.defaultAVCaptureVideoOrientation =  AVCaptureVideoOrientationPortrait ;
    videoCamera.defaultFPS = 30 ;
    videoCamera.grayscaleMode = NO ;
    videoCamera.delegate = self ;
    
    
    faceCascade.load( [[[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_alt2" ofType:@"xml"] UTF8String]) ;
    noseCascade.load( [[[NSBundle mainBundle] pathForResource:@"haarcascade_mcs_nose" ofType:@"xml"] UTF8String])  ;
    mouthCascade.load([[[NSBundle mainBundle] pathForResource:@"haarcascade_mcs_mouth" ofType:@"xml" ] UTF8String]) ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#ifdef __cplusplus
-(void) processImage:(cv::Mat &)image {
    
    Mat grayscaleFrame ;
    cvtColor(image, grayscaleFrame, CV_BGR2GRAY) ;
    equalizeHist(grayscaleFrame, grayscaleFrame) ;
    
    std::vector<cv::Rect> face;
    faceCascade.detectMultiScale(grayscaleFrame, face, 1.1, 2, HaarOptions, cv::Size(60, 60));
    
    for (int i = 0; i < face.size(); i++)
    {
        cv::Point pt1(face[i].x + face[i].width, face[i].y + face[i].height);
        cv::Point pt2(face[i].x, face[i].y);
        
        cv::rectangle(image, pt1, pt2, cvScalar(0, 255, 0, 0), 1, 8 ,0);
    }
    
    
    std::vector<cv::Rect> nose;
    noseCascade.detectMultiScale(grayscaleFrame, nose, 1.1, 2, HaarOptions, cv::Size(60, 60));
    
    for (int i = 0; i < nose.size(); i++)
    {
        cv::Point pt1(nose[i].x + nose[i].width, nose[i].y + nose[i].height);
        cv::Point pt2(nose[i].x, nose[i].y);
        
        cv::rectangle(image, pt1, pt2, cvScalar(0, 255, 0, 0), 1, 8 ,0);
    }
    
    std::vector<cv::Rect> mouthface;
    mouthCascade.detectMultiScale(grayscaleFrame, mouthface, 1.1, 2, HaarOptions, cv::Size(50, 50));
    
    for (int i = 0; i < mouthface.size(); i++)
    {
        cv::Point pt1(mouthface[i].x + mouthface[i].width, mouthface[i].y + mouthface[i].height);
        cv::Point pt2(mouthface[i].x, mouthface[i].y);
        
        cv::rectangle(image, pt1, pt2, cvScalar(255, 0, 0, 0), 1, 8 ,0);
    }
    
}
#endif

- (IBAction)start:(id)sender {
    [videoCamera start];
}

- (IBAction)stop:(id)sender {
    [videoCamera stop];
}

@end
