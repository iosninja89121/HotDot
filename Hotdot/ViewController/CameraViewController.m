//
//  CameraViewController.m
//  Hotdot
//
//  Created by administrator on 3/12/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController
- (IBAction)onClose:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        if ([self.delegate respondsToSelector:@selector(didCancel)]) {
            [self.delegate didCancel];
        }
    }];
}

- (IBAction)onShutter:(id)sender {
    UIViewController *vcCreatePost = [self.storyboard instantiateViewControllerWithIdentifier:VC_CREATE_POST];
    [self.navigationController pushViewController:vcCreatePost animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    view.backgroundColor = UIColorFromRGB(0xD20E0D);
    [self.navigationController.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
