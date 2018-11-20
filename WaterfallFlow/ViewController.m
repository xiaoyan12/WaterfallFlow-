//
//  ViewController.m
//  WaterfallFlow
//
//  Created by 闫世超 on 2018/11/20.
//  Copyright © 2018 闫世超. All rights reserved.
//

#import "ViewController.h"
#import "WSLWaterFlowLayout.h"
#import "XYCollectionViewCell.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>

@property (nonatomic , strong) UICollectionView *collectionView;

@property (nonatomic , strong) NSArray *textArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textArray = @[@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is电脑差几十年嫩",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is电脑差几十年嫩电脑差几十年嫩电脑差几十年嫩电脑差几十年嫩",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is电脑差几十年嫩电脑差几十年嫩",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is电脑差几十年嫩电脑差几十年嫩",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is电脑差几十年嫩电脑差几十年嫩",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is电脑差几十年嫩电脑差几十年嫩电脑差几十年嫩电脑差几十年嫩",@"电脑差几十年嫩草吵闹吵闹次才能草丛摩擦什么房产税嫩草是死哦你你才能从嫩草包is",];
    [self.view addSubview:self.collectionView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//懒加载
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        WSLWaterFlowLayout *layout = [[WSLWaterFlowLayout alloc]init];
        layout.delegate = self;
        layout.flowLayoutStyle = WSLWaterFlowVerticalEqualWidth;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        //注册item
        [_collectionView registerClass:XYCollectionViewCell.class forCellWithReuseIdentifier:@"XYCollectionViewCell"];
        
    }
    return _collectionView;
}


#pragma mark - WSLWaterFlowLayoutDelegate
//返回每个item大小
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0, [XYCollectionViewCell getCellHeightWithText:self.textArray[indexPath.row]]+(kScreenWidth-25.0f)/2.0f+100.0f);
}

/** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section{
    return CGSizeZero;
}
/** 脚视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section{
    return CGSizeZero;
}

/** 列数*/
-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 2;
}
/** 行数*/
-(CGFloat)rowCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 1;
}
/** 列间距*/
-(CGFloat)columnMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 5;
}
/** 行间距*/
-(CGFloat)rowMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 5;
}
/** 边缘之间的间距*/
-(UIEdgeInsets)edgeInsetInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - collectionView delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.textArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XYCollectionViewCell" forIndexPath:indexPath];
    [cell updateContentText:self.textArray[indexPath.row]];
    return cell;
}



@end
