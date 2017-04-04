//
//  MainViewController.h
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabbarDelegate <NSObject>

@optional

- (void)didOnActivityTabFromViewConroller:(UIViewController*)controller;
- (void)didOnFeedTabFromViewConroller:(UIViewController*)controller;
- (void)didOnShutterTabFromViewConroller:(UIViewController*)controller;
- (void)didOnCollaborationTabFromViewConroller:(UIViewController*)controller;
- (void)didOnProfileTabFromViewConroller:(UIViewController*)controller;

@end

@protocol CameraViewDelegate <NSObject>

@optional

- (void)didComplete;
- (void)didCancel;

@end

@interface MainViewController : UIViewController

@end
