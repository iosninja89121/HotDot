//
//  ChooseFriendViewController.m
//  Hotdot
//
//  Created by administrator on 3/13/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "ChooseFriendViewController.h"

@interface ChooseFriendViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblFriend;
@property (nonatomic, strong) NSArray *arrData;

@end

@implementation ChooseFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tblFriend.dataSource = self;
    self.tblFriend.delegate = self;
    
    [self setCustomNavigationBar];
    
    self.arrData = @[
                     @{
                         KEY_FEED_AVATAR:@"avatar1",
                         KEY_FEED_NAME:@"Susan Lee",
                         KEY_FEED_TEXT:@"YES"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar2",
                         KEY_FEED_NAME:@"Lori Gomez",
                         KEY_FEED_TEXT:@"YES"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar3",
                         KEY_FEED_NAME:@"Heather Porter",
                         KEY_FEED_TEXT:@"NO"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar4",
                         KEY_FEED_NAME:@"Sara Mendoza",
                         KEY_FEED_TEXT:@"NO"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar5",
                         KEY_FEED_NAME:@"Joan Bishop",
                         KEY_FEED_TEXT:@"NO"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar6",
                         KEY_FEED_NAME:@"Melissa Guzman",
                         KEY_FEED_TEXT:@"NO"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar7",
                         KEY_FEED_NAME:@"Randy Sanders",
                         KEY_FEED_TEXT:@"NO"},
                     
                     @{
                         KEY_FEED_AVATAR:@"avatar8",
                         KEY_FEED_NAME:@"Jeremy Bradley",
                         KEY_FEED_TEXT:@"NO"},
                     
                     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self.navigationItem setTitle:@"CHOOSE FRIEND"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    view.backgroundColor = UIColorFromRGB(0xD20E0D);
    [self.navigationController.view addSubview:view];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_FRIEND];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_FRIEND];
    }
    
    NSDictionary *dicItem = [self.arrData objectAtIndex:indexPath.row];
    UIImageView *imgvAvatar = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lblTitle = (UILabel *)[cell.contentView viewWithTag:2];
    
    
    [imgvAvatar setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_FEED_AVATAR]]];
    [imgvAvatar.layer setMasksToBounds:YES];
    [imgvAvatar.layer setCornerRadius:22];
    
    [lblTitle setText:[dicItem valueForKey:KEY_FEED_NAME]];
    
    NSString *strFlag = [dicItem valueForKey:KEY_FEED_TEXT];
    
    if([strFlag isEqualToString:@"YES"]) {
        [[cell.contentView viewWithTag:3] setHidden:NO];
        [[cell.contentView viewWithTag:4] setHidden:YES];
    } else {
        [[cell.contentView viewWithTag:3] setHidden:YES];
        [[cell.contentView viewWithTag:4] setHidden:NO];
    }
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
