//
//  TeamViewController.m
//  Hotdot
//
//  Created by administrator on 3/13/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "TeamViewController.h"

@interface TeamViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblTeam;
@property (nonatomic, strong) NSArray *arrData;
@end

@implementation TeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrData = @[
                     @{
                         KEY_FEED_NAME:@"Susan Lee",
                         KEY_FEED_AVATAR:@"avatar1"},
                     
                     @{
                         KEY_FEED_NAME:@"Lori Gomez",
                         KEY_FEED_AVATAR:@"avatar2"}];
    [self setCustomNavigationBar];
    
    self.tblTeam.dataSource = self;
    self.tblTeam.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onEdit {
    UIViewController *vcTeamEdit = [self.storyboard instantiateViewControllerWithIdentifier:VC_TEAM_EDIT];
    [self.navigationController pushViewController:vcTeamEdit animated:YES];
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
    [self.navigationItem setTitle:@"TEAM"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit)];
    
    self.navigationItem.rightBarButtonItem.tintColor = UIColorFromRGB(0xFFC200);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_TEAM];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_TEAM];
    }
    
    NSDictionary *dicItem = [self.arrData objectAtIndex:indexPath.row];
    UIImageView *imgvAvatar = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lblTitle = (UILabel *)[cell.contentView viewWithTag:2];
    
    
    [imgvAvatar setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_FEED_AVATAR]]];
    [imgvAvatar.layer setMasksToBounds:YES];
    [imgvAvatar.layer setCornerRadius:22];
    
    [lblTitle setText:[dicItem valueForKey:KEY_FEED_NAME]];
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


@end
