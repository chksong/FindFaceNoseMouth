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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#ifdef __cplusplus
-(void) processImage:(cv::Mat &)image {
    
}
#endif

- (IBAction)start:(id)sender {
    [videoCamera start];
}

- (IBAction)stop:(id)sender {
    [videoCamera stop];
}

@end
