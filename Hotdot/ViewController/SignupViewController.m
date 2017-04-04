//
//  SignupViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfFullName;
@property (weak, nonatomic) IBOutlet UITextField *tfEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation SignupViewController
- (IBAction)onSignup:(id)sender {
}

- (IBAction)onCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {
    
    self.tfFullName.layer.masksToBounds = YES;
    self.tfFullName.layer.borderWidth = 1.0;
    self.tfFullName.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    self.tfEmailAddress.layer.masksToBounds = YES;
    self.tfEmailAddress.layer.borderWidth = 1.0;
    self.tfEmailAddress.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    self.tfUsername.layer.masksToBounds = YES;
    self.tfUsername.layer.borderWidth = 1.0;
    self.tfUsername.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    self.tfPassword.layer.masksToBounds = YES;
    self.tfPassword.layer.borderWidth = 1.0;
    self.tfPassword.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    UIView *paddingViewFullName = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfFullName.leftView = paddingViewFullName;
    self.tfFullName.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingViewEmail = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfEmailAddress.leftView = paddingViewEmail;
    self.tfEmailAddress.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingViewUsername = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfUsername.leftView = paddingViewUsername;
    self.tfUsername.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingViewPassword = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfPassword.leftView = paddingViewPassword;
    self.tfPassword.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
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
