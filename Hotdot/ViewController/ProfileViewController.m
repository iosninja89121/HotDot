//
//  ProfileViewController.m
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ProfileViewController
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
    [self setupCollectionView];
}

-(void)setupCollectionView {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    CGFloat width_CollectionCell = self.view.frame.size.width - 6;
    
    UICollectionViewFlowLayout *collectionFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectionFlowLayout setMinimumInteritemSpacing:3.0f];
    [collectionFlowLayout setMinimumLineSpacing:3.0f];
    [collectionFlowLayout setItemSize:CGSizeMake(width_CollectionCell / 3, width_CollectionCell / 3)];
    
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:collectionFlowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Collection view data source and delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_PORTFOLIO forIndexPath:indexPath];
    
    UIImageView *imgvPic = (UIImageView *)[cell.contentView viewWithTag:1];
    if(indexPath.row  == 0) {
        [imgvPic setImage:[UIImage imageNamed:@"pic1.png"]];
    } else {
        [imgvPic setHidden: YES];
    }
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return YES;
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
