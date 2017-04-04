//
//  FeedViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (nonatomic, strong) NSArray *arrData;
@end

@implementation FeedViewController
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
                     @{
                         KEY_FEED_NAME:@"Sarah",
                         KEY_FEED_AVATAR:@"avatar1",
                         KEY_FEED_TIME:@"10 minutes",
                         KEY_FEED_IMAGE:@"landscape1",
                         KEY_FEED_TEXT:@"Maecenas sed diam eget risus vanus blandit sit amet non magna.",
                         KEY_FEED_COMMENTS:@"5",
                         KEY_FEED_LIKES:@"10"},
                     
                     @{
                         KEY_FEED_NAME:@"Joe",
                         KEY_FEED_AVATAR:@"avatar2",
                         KEY_FEED_TIME:@"40 minutes",
                         KEY_FEED_IMAGE:@"landscape2",
                         KEY_FEED_TEXT:@"Harahh era pas eget apoi vanus blandit sit amet non magna.",
                         KEY_FEED_COMMENTS:@"15",
                         KEY_FEED_LIKES:@"20"},
                     
                     @{
                         KEY_FEED_NAME:@"Tom",
                         KEY_FEED_AVATAR:@"avatar3",
                         KEY_FEED_TIME:@"1 days",
                         KEY_FEED_IMAGE:@"landscape3",
                         KEY_FEED_TEXT:@"adfasf daa ree cgea ddda vanus blandit sit amet non magna.",
                         KEY_FEED_COMMENTS:@"15",
                         KEY_FEED_LIKES:@"20"},
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_FEED];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_FEED];
    }
    
    NSDictionary *dicItem = [self.arrData objectAtIndex:indexPath.row];
    UIImageView *imgvAvatar = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lblName = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *lblTime = (UILabel *)[cell.contentView viewWithTag:3];
    UIImageView *imgvPic = (UIImageView *)[cell.contentView viewWithTag:4];
    UILabel *lblText = (UILabel *)[cell.contentView viewWithTag:5];
    UILabel *lblLikes = (UILabel *)[cell.contentView viewWithTag:7];
    UILabel *lblComments = (UILabel *)[cell.contentView viewWithTag:9];
    
    [imgvAvatar setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_FEED_AVATAR]]];
    [imgvAvatar.layer setMasksToBounds:YES];
    [imgvAvatar.layer setCornerRadius:16];
    
    [lblName setText:[dicItem valueForKey:KEY_FEED_NAME]];
    [lblTime setText:[NSString stringWithFormat:@"%@ ago", [dicItem valueForKey:KEY_FEED_TIME]]];
    [imgvPic setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_FEED_IMAGE]]];
    [lblText setText:[dicItem valueForKey:KEY_FEED_TEXT]];
    [lblLikes setText:[dicItem valueForKey:KEY_FEED_LIKES]];
    [lblComments setText:[dicItem valueForKey:KEY_FEED_COMMENTS]];
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 330;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vcPost = [self.storyboard instantiateViewControllerWithIdentifier:VC_POST];
    [self.navigationController pushViewController:vcPost animated:YES];
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
