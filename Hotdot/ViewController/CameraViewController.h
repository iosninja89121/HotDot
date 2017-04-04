//
//  CameraViewController.h
//  Hotdot
//
//  Created by administrator on 3/12/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface CameraViewController : UIViewController
@property (nonatomic, weak) id<CameraViewDelegate> delegate;

@end
