//
//  MainViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "MainViewController.h"
#import "ActivityViewController.h"
#import "FeedViewController.h"
#import "CollaborationViewController.h"
#import "ProfileViewController.h"
#import "CameraViewController.h"

@interface MainViewController ()<TabbarDelegate, CameraViewDelegate>
@property (nonatomic) UIViewController *viewcontroller;

@end

@implementation MainViewController

- (void)removePreviousViewCtrl {
    if(self.viewcontroller) {
        [self.viewcontroller willMoveToParentViewController:nil];
        [self.viewcontroller.view removeFromSuperview];
        [self.viewcontroller removeFromParentViewController];
    }
}

- (void)addViewCtrlWithIdentifier:(NSString *)strID {
    self.viewcontroller = [self.storyboard instantiateViewControllerWithIdentifier:strID];
    [self addChildViewController:self.viewcontroller];
    self.viewcontroller.view.frame = self.view.bounds;
    [self.view addSubview:self.viewcontroller.view];
    [self.viewcontroller didMoveToParentViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setCustomNavigationBar];
    [self didOnActivityTabFromViewConroller:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set Custom Navigation Bar

- (void) onMenu {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void) onEdit {
    UIViewController *vcNewCollaboartion = [self.storyboard instantiateViewControllerWithIdentifier:VC_NEW_COLLABORATION];
    [self.navigationController pushViewController:vcNewCollaboartion animated:YES];
}


- (void) setCustomNavigationBar {
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLeft setFrame:CGRectMake(0, 0, 22, 22)];
    [btnLeft setImage:[UIImage imageNamed:@"ic_menu.png"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(onMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnLeft = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
    [barBtnLeft setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = barBtnLeft;
    
    //set bar color
    UIColor *colorTint = UIColorFromRGB(0xD20E0D);
    [self.navigationController.navigationBar setBackgroundColor:colorTint];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    //set title and title color
    [self.navigationItem setTitle:@"ACTIVITY"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    view.backgroundColor = UIColorFromRGB(0xD20E0D);
    [self.navigationController.view addSubview:view];
    
}

#pragma mark - Camera View Delegate
- (void)didComplete {
    [SVProgressHUD showSuccessWithStatus:@"Complete"];
}

- (void)didCancel {
    [SVProgressHUD showSuccessWithStatus:@"Cancel"];
}

#pragma mark - Tabbar Delegate
- (void)didOnActivityTabFromViewConroller:(UIViewController*)controller {
    
    [self removePreviousViewCtrl];
    [self addViewCtrlWithIdentifier:VC_ACTIVITY];
    ((ActivityViewController *)self.viewcontroller).delegate = self;
    
    [self.navigationItem setTitle:@"ACTIVITY"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] init];
    
}

- (void)didOnFeedTabFromViewConroller:(UIViewController*)controller {
    
    [self removePreviousViewCtrl];
    [self addViewCtrlWithIdentifier:VC_FEED];
    ((FeedViewController *)self.viewcontroller).delegate = self;
    
    [self.navigationItem setTitle:@"FEED"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] init];
}

- (void)didOnShutterTabFromViewConroller:(UIViewController*)controller {
    CameraViewController *vcCamera = [self.storyboard instantiateViewControllerWithIdentifier:VC_CAMERA];
    vcCamera.delegate = self;
    
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vcCamera];
    [navCtrl setNavigationBarHidden:YES];
    
    [self presentViewController:navCtrl animated:YES completion:nil];
}

- (void)didOnCollaborationTabFromViewConroller:(UIViewController*)controller {
    
    [self removePreviousViewCtrl];
    [self addViewCtrlWithIdentifier:VC_COLLABORATION];
    ((CollaborationViewController *)self.viewcontroller).delegate = self;
    [self.navigationItem setTitle:@"COLLABORATE"];
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setFrame:CGRectMake(0, 0, 22, 22)];
    [btnRight setImage:[UIImage imageNamed:@"ic_edit.png"] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(onEdit) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnRight = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = barBtnRight;
}

- (void)didOnProfileTabFromViewConroller:(UIViewController*)controller {
    
    [self removePreviousViewCtrl];
    [self addViewCtrlWithIdentifier:VC_PROFILE];
    ((ProfileViewController *)self.viewcontroller).delegate = self;
    
    [self.navigationItem setTitle:@"PROFILE"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] init];
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
