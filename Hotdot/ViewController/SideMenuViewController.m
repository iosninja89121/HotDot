//
//  SideMenuViewController.m
//  Hotdot
//
//  Created by administrator on 3/12/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController
- (IBAction)onProfession:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"Profession"];
}

- (IBAction)onLocation:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"Location"];
}

- (IBAction)onSkillLevel:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"Skill Level"];
}

- (IBAction)onPriceRange:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"Price Range"];
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
