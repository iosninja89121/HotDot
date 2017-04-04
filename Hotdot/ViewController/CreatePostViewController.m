//
//  CreatePostViewController.m
//  Hotdot
//
//  Created by administrator on 3/12/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "CreatePostViewController.h"
#import "CameraViewController.h"

@interface CreatePostViewController ()

@end

@implementation CreatePostViewController
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onSave:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSArray *viewControllers = self.navigationController.viewControllers;
        CameraViewController *vcCamera = [viewControllers objectAtIndex:0];
        
        if ([vcCamera.delegate respondsToSelector:@selector(didComplete)]) {
            [vcCamera.delegate didComplete];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
