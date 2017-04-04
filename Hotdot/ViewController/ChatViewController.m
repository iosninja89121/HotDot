//
//  ChatViewController.m
//  Hotdot
//
//  Created by administrator on 3/13/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblContainer;
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet UITableView *tblChat;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tblContainer.delegate = self;
    self.tblContainer.dataSource = self;
    self.tblChat.delegate = self;
    self.tblChat.dataSource = self;
    
    self.viewContainer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self setCustomNavigationBar];
}


-(void)dismissKeyboard {
    [self.textField resignFirstResponder];
}

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onTeam {
    UIViewController *vcTeam = [self.storyboard instantiateViewControllerWithIdentifier:VC_TEAM];
    [self.navigationController pushViewController:vcTeam animated:YES];
    
}

- (void)onFiles {
    UIViewController *vcFiles = [self.storyboard instantiateViewControllerWithIdentifier:VC_FILES];
    [self.navigationController pushViewController:vcFiles animated:YES];
}

- (void) setCustomNavigationBar {
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLeft setFrame:CGRectMake(0, 0, 22, 22)];
    [btnLeft setImage:[UIImage imageNamed:@"ic_back.png"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
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
    [self.navigationItem setTitle:@"CHAT"];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    UIBarButtonItem *barBtnItemTeam = [[UIBarButtonItem alloc] initWithTitle:@"Team" style:UIBarButtonItemStylePlain target:self action:@selector(onTeam)];
    
    UIBarButtonItem *barBtnItemFiles = [[UIBarButtonItem alloc] initWithTitle:@"Files" style:UIBarButtonItemStylePlain target:self action:@selector(onFiles)];
    
    
    barBtnItemTeam.tintColor = UIColorFromRGB(0xFFC200);
    barBtnItemFiles.tintColor = UIColorFromRGB(0xFFC200);
    
    self.navigationItem.rightBarButtonItems = @[barBtnItemFiles, barBtnItemTeam];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.tblContainer) {
        return 0;
    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == self.tblContainer) {
        return nil;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SampleCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SampleCell"];
    }
    
    return cell;
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
