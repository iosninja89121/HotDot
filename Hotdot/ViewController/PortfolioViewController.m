//
//  PortfolioViewController.m
//  Hotdot
//
//  Created by administrator on 3/12/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "PortfolioViewController.h"

@interface PortfolioViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation PortfolioViewController
- (IBAction)onPrev:(id)sender {
    [self onBack];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setCustomNavigationBar];
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onFollow {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@"Great Scotts! You are now following Smithen Johannsen the construction guru"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    //We add buttons to the alert controller by creating UIAlertActions:
    UIAlertAction *actionClose = [UIAlertAction actionWithTitle:@"Close"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil]; //You can use a block here to handle a press on this button
    UIAlertAction *actionMessage = [UIAlertAction actionWithTitle:@"Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:actionClose];
    [alertController addAction:actionMessage];
    [self presentViewController:alertController animated:YES completion:nil];
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
    [self.navigationItem setTitle:@"PROFILE"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Follow" style:UIBarButtonItemStylePlain target:self action:@selector(onFollow)];
    
    self.navigationItem.rightBarButtonItem.tintColor = UIColorFromRGB(0xFFC200);
    
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
    UIViewController *vcDetail = [self.storyboard instantiateViewControllerWithIdentifier:VC_PORTFOLIO_DETAIL];
    [self.navigationController pushViewController:vcDetail animated:YES];
    
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
