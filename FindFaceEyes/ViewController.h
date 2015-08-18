//
//  ViewController.h
//  FindFaceEyes
//
//  Created by chksong on 15/8/17.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#import <opencv2/objdetect/objdetect.hpp>
#endif 

#import <opencv2/highgui/cap_ios.h>
#import <opencv2/imgproc/imgproc_c.h>

using namespace cv ;

@interface ViewController : UIViewController<CvVideoCameraDelegate>
{
    CvVideoCamera* videoCamera ;
    
    __weak IBOutlet UIImageView *imageView;
}

@end

