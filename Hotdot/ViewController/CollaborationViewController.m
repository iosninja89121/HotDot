//
//  CollaborationViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "CollaborationViewController.h"

@interface CollaborationViewController ()
@property (nonatomic, strong) NSArray *arrData;
@end

@implementation CollaborationViewController
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
                         KEY_COLLABORATE_TITLE:@"Johnson Electric Co.",
                         KEY_COLLABORATE_INFO:@"Jonhny T",
                         KEY_COLLABORATE_AVATAR:@"avatar1",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"West Wacker HQ.",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar2",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"12234 Penn St.",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar3",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"The Brixton Building",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar4",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"123 Uptown",
                         KEY_COLLABORATE_INFO:@"Philip Newdle",
                         KEY_COLLABORATE_AVATAR:@"avatar5",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"New Construction Project",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar6",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"Johnson Electric Co.",
                         KEY_COLLABORATE_INFO:@"Jonhny T",
                         KEY_COLLABORATE_AVATAR:@"avatar1",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"West Wacker HQ.",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar2",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"12234 Penn St.",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar3",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"The Brixton Building",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar4",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"123 Uptown",
                         KEY_COLLABORATE_INFO:@"Philip Newdle",
                         KEY_COLLABORATE_AVATAR:@"avatar5",
                         KEY_COLLABORATE_TIME:@"1 day ago"},
                     
                     @{
                         KEY_COLLABORATE_TITLE:@"New Construction Project",
                         KEY_COLLABORATE_INFO:@"John Smithen, BXR Building",
                         KEY_COLLABORATE_AVATAR:@"avatar6",
                         KEY_COLLABORATE_TIME:@"1 day ago"}

                     ];
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

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_COLLABORATION];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_COLLABORATION];
    }
    
    NSDictionary *dicItem = [self.arrData objectAtIndex:indexPath.row];
    UIImageView *imgvAvatar = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lblTitle = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *lblInfo = (UILabel *)[cell.contentView viewWithTag:3];
    UILabel *lblTime = (UILabel *)[cell.contentView viewWithTag:4];
    
    
    [imgvAvatar setImage:[UIImage imageNamed:[dicItem valueForKey:KEY_COLLABORATE_AVATAR]]];
    [imgvAvatar.layer setMasksToBounds:YES];
    [imgvAvatar.layer setCornerRadius:22];
    
    [lblTitle setText:[dicItem valueForKey:KEY_COLLABORATE_TITLE]];
    [lblInfo setText:[dicItem valueForKey:KEY_COLLABORATE_INFO]];
    [lblTime setText:[dicItem valueForKey:KEY_COLLABORATE_TIME]];
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vcChat = [self.storyboard instantiateViewControllerWithIdentifier:VC_CHAT];
    [self.navigationController pushViewController:vcChat animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
