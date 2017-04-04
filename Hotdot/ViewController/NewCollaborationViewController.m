//
//  NewCollaborationViewController.m
//  Hotdot
//
//  Created by administrator on 3/13/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "NewCollaborationViewController.h"

@interface NewCollaborationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfProjectName;
@property (weak, nonatomic) IBOutlet UITextField *tfFriends;
@property (weak, nonatomic) IBOutlet UIView *viewCover;

@end

@implementation NewCollaborationViewController
- (IBAction)onCreate:(id)sender {
    [self.viewCover setHidden:NO];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@"You have created the project. Now start collaborating. Get the project organized through chat."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    //We add buttons to the alert controller by creating UIAlertActions:
    UIAlertAction *actionClose = [UIAlertAction actionWithTitle:@"Project"
                                                          style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                [self.viewCover setHidden:YES];
                                                            }]; //You can use a block here to handle a press on this button
    UIAlertAction *actionMessage = [UIAlertAction actionWithTitle:@"Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.viewCover setHidden:YES];
    }];
    
    [alertController addAction:actionClose];
    [alertController addAction:actionMessage];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
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
    
    self.tfProjectName.layer.masksToBounds = YES;
    self.tfProjectName.layer.borderWidth = 1.0;
    self.tfProjectName.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    self.tfFriends.layer.masksToBounds = YES;
    self.tfFriends.layer.borderWidth = 1.0;
    self.tfFriends.layer.borderColor = [UIColorFromRGB(0xECECED) CGColor];
    
    UIView *paddingViewProjectName = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfProjectName.leftView = paddingViewProjectName;
    self.tfProjectName.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingViewFriends = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.tfFriends.leftView = paddingViewFriends;
    self.tfFriends.leftViewMode = UITextFieldViewModeAlways;
    
    [self.viewCover setHidden:YES];
    
    self.tfProjectName.delegate = self;
    self.tfFriends.delegate = self;
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

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UIViewController *vcChooseFriend = [self.storyboard instantiateViewControllerWithIdentifier:VC_CHOOSE_FRIEND];
    [self.navigationController pushViewController:vcChooseFriend animated:YES];
    return NO;
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
