//
//  XYCollectionViewCell.m
//  WaterfallFlow
//
//  Created by 闫世超 on 2018/11/20.
//  Copyright © 2018 闫世超. All rights reserved.
//

#import "XYCollectionViewCell.h"
#import <Masonry.h>

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width


@interface XYCollectionViewCell ()

@property (nonatomic , strong) UIImageView *icon_image;//图片

@property (nonatomic , strong) UILabel *content;//描述内容

@property (nonatomic , strong) UIView *bgView;//放一些其他的控件的view

@end

@implementation XYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        self.contentView.layer.cornerRadius = 5.0f;
        self.contentView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)createUI{
    
    __weak typeof(self) weakSelf = self;
    
    [self.contentView addSubview:self.icon_image];
    [self.icon_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kScreenWidth-25.0f)/2.0f, (kScreenWidth-25.0f)/2.0f));
        make.left.mas_equalTo(weakSelf.contentView.mas_left);
        make.top.mas_equalTo(weakSelf.contentView.mas_top);
    }];
    
    [self.contentView addSubview:self.content];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left);
        make.right.mas_equalTo(weakSelf.contentView.mas_right);
        make.top.mas_equalTo(weakSelf.icon_image.mas_bottom);
    }];
    
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left);
        make.right.mas_equalTo(weakSelf.contentView.mas_right);
        make.top.mas_equalTo(weakSelf.content.mas_bottom);
        make.height.mas_equalTo(100.0f);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom);
    }];
    
}
//懒加载控件
- (UIImageView *)icon_image{
    if (!_icon_image) {
        _icon_image = [[UIImageView alloc]init];
        _icon_image.backgroundColor = [UIColor cyanColor];
    }
    return _icon_image;
}

- (UILabel *)content{
    if (!_content ) {
        _content = [[UILabel alloc]init];
        _content.font = [UIFont boldSystemFontOfSize:14.0f];
        _content.numberOfLines = 0;
    }
    return _content;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor yellowColor];
    }
    return _bgView;
}


- (void)updateContentText:(NSString *)text{
    self.content.text = text;
}

+ (CGFloat)getCellHeightWithText:(NSString *)text{

    // 段落设置与实际显示的 Label 属性一致 采用 NSMutableParagraphStyle 设置Nib 中 Label 的相关属性传入到 NSAttributeString 中计算；
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f], NSParagraphStyleAttributeName:style}];
    CGSize size =  [string boundingRectWithSize:CGSizeMake((kScreenWidth-25.0f)/2.0f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    // 并不是高度计算不对，我估计是计算出来的数据是 小数，在应用到布局的时候稍微差一点点就不能保证按照计算时那样排列，所以为了确保布局按照我们计算的数据来，就在原来计算的基础上 取ceil值，再加1；
    return  ceil(size.height) + 1;
    
}


@end
