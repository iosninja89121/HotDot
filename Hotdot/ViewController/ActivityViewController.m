//
//  ActivityViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()
@property (nonatomic, strong) NSArray *arrData;
@end

@implementation ActivityViewController
- (IBAction)onActivityTab:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didOnActivityTabFromViewConroller:)]) {
        [self.delegate didOnActivityTabFromViewConroller:self];
    }
}

- (IBAction)onFeedTab:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didOnFeedTabFromViewConroller:)]) {
        [self.delegate didOnFeedTabFromViewConroller:self];
    }
}
- (IBAction)onShutterTab:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didOnShutterTabFromViewConroller:)]) {
        [self.delegate didOnShutterTabFromViewConroller:self];
    }
}
- (IBAction)onCollaborationTab:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didOnCollaborationTabFromViewConroller:)]) {
        [self.delegate didOnCollaborationTabFromViewConroller:self];
    }
}
- (IBAction)onProfileTab:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didOnProfileTabFromViewConroller:)]) {
        [self.delegate didOnProfileTabFromViewConroller:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrData = @[
                     @{KEY_ACTIVITY_MODE:ACTIVITY_COMMENT,
                       KEY_ACTIVITY_NAME:@"Pamela",
                       KEY_ACTIVITY_TIME:@"10 minutes",
                       KEY_ACTIVITY_AVATAR:@"avatar1",
                       KEY_ACTIVITY_IMAGE:@"pic1"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_FRIEND,
                         KEY_ACTIVITY_NAME:@"Josh",
                         KEY_ACTIVITY_TIME:@"20 minutes",
                         KEY_ACTIVITY_AVATAR:@"avatar2"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_LIKE,
                         KEY_ACTIVITY_NAME:@"Chris",
                         KEY_ACTIVITY_TIME:@"1 hour",
                         KEY_ACTIVITY_AVATAR:@"avatar3",
                         KEY_ACTIVITY_IMAGE:@"pic3"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_FRIEND,
                         KEY_ACTIVITY_NAME:@"Sarah",
                         KEY_ACTIVITY_TIME:@"2 days",
                         KEY_ACTIVITY_AVATAR:@"avatar4"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_FRIEND,
                         KEY_ACTIVITY_NAME:@"Luke",
                         KEY_ACTIVITY_TIME:@"3 days",
                         KEY_ACTIVITY_AVATAR:@"avatar5"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_LIKE,
                         KEY_ACTIVITY_NAME:@"Christina",
                         KEY_ACTIVITY_TIME:@"3 days",
                         KEY_ACTIVITY_AVATAR:@"avatar6",
                         KEY_ACTIVITY_IMAGE:@"pic6"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_COMMENT,
                         KEY_ACTIVITY_NAME:@"Eric",
                         KEY_ACTIVITY_TIME:@"4 days",
                         KEY_ACTIVITY_AVATAR:@"avatar7",
                         KEY_ACTIVITY_IMAGE:@"pic7"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_COMMENT,
                         KEY_ACTIVITY_NAME:@"Chris",
                         KEY_ACTIVITY_TIME:@"4 days",
                         KEY_ACTIVITY_AVATAR:@"avatar8",
                         KEY_ACTIVITY_IMAGE:@"pic8"},
                     
                     @{KEY_ACTIVITY_MODE:ACTIVITY_COMMENT,
                       KEY_ACTIVITY_NAME:@"Pamela",
                       KEY_ACTIVITY_TIME:@"10 minutes",
                       KEY_ACTIVITY_AVATAR:@"avatar1",
                       KEY_ACTIVITY_IMAGE:@"pic1"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_FRIEND,
                         KEY_ACTIVITY_NAME:@"Josh",
                         KEY_ACTIVITY_TIME:@"20 minutes",
                         KEY_ACTIVITY_AVATAR:@"avatar2"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_LIKE,
                         KEY_ACTIVITY_NAME:@"Chris",
                         KEY_ACTIVITY_TIME:@"1 hour",
                         KEY_ACTIVITY_AVATAR:@"avatar3",
                         KEY_ACTIVITY_IMAGE:@"pic3"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_FRIEND,
                         KEY_ACTIVITY_NAME:@"Sarah",
                         KEY_ACTIVITY_TIME:@"2 days",
                         KEY_ACTIVITY_AVATAR:@"avatar4"},
                     
                     @{
                         KEY_ACTIVITY_MODE:ACTIVITY_FRIEND,
                         KEY_ACTIVITY_NAME:@"Luke",
                         KEY_ACTIVITY_TIME:@"3 days",
                         KEY_ACTIVITY_AVATAR:@"avatar5"}
                     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    NSDictionary *dicItem = [self.arrData objectAtIndex:indexPath.row];
    NSString *strMode = [dicItem valueForKey:KEY_ACTIVITY_MODE];
    NSString *strText = @"";
    
    if ([strMode isEqualToString:ACTIVITY_COMMENT]) {
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_ACTIVITY_COMMENT];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ACTIVITY_COMMENT];
        }
        
        strText = [NSString stringWithFormat:@"%@ commented on you", [dicItem valueForKey:KEY_ACTIVITY_NAME]];
        
    } else if ([strMode isEqualToString:ACTIVITY_FRIEND]) {
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_ACTIVITY_FRIEND];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ACTIVITY_FRIEND];
        }
        
        strText = [NSString stringWithFormat:@"%@ wants to be your friend!", [dicItem valueForKey:KEY_ACTIVITY_NAME]];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_ACTIVITY_LIKE];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ACTIVITY_LIKE];
        }
        
        strText = [NSString stringWithFormat:@"%@ liked your photo.", [dicItem valueForKey:KEY_ACTIVITY_NAME]];
    }
    
    UIImageView *imgvAvatar = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lblText = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *lblTime = (UILabel *)[cell.contentView viewWithTag:3];
    UIImageView *imgvPic = (UIImageView *)[cell.contentView viewWithTag:4];
    
    [imgvAvatar setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_ACTIVITY_AVATAR]]];
    [imgvAvatar.layer setMasksToBounds:YES];
    [imgvAvatar.layer setCornerRadius:22];
    
    [lblText setText:strText];
    [lblTime setText:[NSString stringWithFormat:@"%@ ago", [dicItem valueForKey:KEY_ACTIVITY_TIME]]];
    
    if(imgvPic != nil) {
        [imgvPic setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_ACTIVITY_IMAGE]]];
        [imgvPic.layer setMasksToBounds:YES];
        [imgvPic.layer setCornerRadius:5];
    }
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vcOverview = [self.storyboard instantiateViewControllerWithIdentifier:VC_OVERVIEW];
    [self.navigationController pushViewController:vcOverview animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
