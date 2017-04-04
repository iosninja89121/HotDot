//
//  LoginViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation LoginViewController
- (IBAction)onLogin:(id)sender {
    [self gotoMain];
}

- (IBAction)onForgotPassword:(id)sender {
}

- (IBAction)onSignup:(id)sender {
    UIViewController *vcSignup = [self.storyboard instantiateViewControllerWithIdentifier:VC_SIGNUP];
    [self.navigationController pushViewController:vcSignup animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [self.tfEmail resignFirstResponder];
    [self.tfPassword resignFirstResponder];
}

- (void) gotoMain {
    UIViewController *leftVC = [self.storyboard instantiateViewControllerWithIdentifier:VC_SIDE_MENU];
    UINavigationController *mainNVC = [self.storyboard instantiateViewControllerWithIdentifier:NC_MAIN];
    
    MFSideMenuContainerViewController *sideMenuContainerVC = [MFSideMenuContainerViewController containerWithCenterViewController:mainNVC leftMenuViewController:leftVC rightMenuViewController:nil];
    
    sideMenuContainerVC.panMode = MFSideMenuPanModeNone;
    
    [UIView transitionWithView:[appDelegate window]
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^(void){
                        BOOL oldState = [UIView areAnimationsEnabled];
                        [UIView setAnimationsEnabled:NO];
                        
                        [[appDelegate window] setRootViewController:sideMenuContainerVC];
                        
                        [UIView setAnimationsEnabled:oldState];
                    }
                    completion:nil];
}

- (void)initUI {
    
    self.tfEmail.layer.masksToBounds = YES;
    self.tfEmail.layer.borderWidth = 1.0;
    self.tfEmail.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    self.tfPassword.layer.masksToBounds = YES;
    self.tfPassword.layer.borderWidth = 1.0;
    self.tfPassword.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    UIView *paddingViewEmail = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfEmail.leftView = paddingViewEmail;
    self.tfEmail.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingViewPassword = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfPassword.leftView = paddingViewPassword;
    self.tfPassword.leftViewMode = UITextFieldViewModeAlways;
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
