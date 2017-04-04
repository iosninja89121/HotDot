//
//  NewCollaborationOtherViewController.m
//  Hotdot
//
//  Created by administrator on 3/13/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "NewCollaborationOtherViewController.h"

@interface NewCollaborationOtherViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfProject;
@property (weak, nonatomic) IBOutlet UIView *viewMemebers;

@end

@implementation NewCollaborationOtherViewController
- (IBAction)onCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self setCustomNavigationBar];
}


- (void)initUI {
    
    self.tfProject.layer.masksToBounds = YES;
    self.tfProject.layer.borderWidth = 1.0;
    self.tfProject.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    self.viewMemebers.layer.masksToBounds = YES;
    self.viewMemebers.layer.borderWidth = 1.0;
    self.viewMemebers.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    UIView *paddingViewProjectName = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.tfProject.leftView = paddingViewProjectName;
    self.tfProject.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void) setCustomNavigationBar {
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    
    
    //set bar color
    UIColor *colorTint = UIColorFromRGB(0xD20E0D);
    [self.navigationController.navigationBar setBackgroundColor:colorTint];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    //set title and title color
    [self.navigationItem setTitle:@"NEW PROJECT"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
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
