//
//  XYCollectionViewCell.h
//  WaterfallFlow
//
//  Created by 闫世超 on 2018/11/20.
//  Copyright © 2018 闫世超. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYCollectionViewCell : UICollectionViewCell

- (void)updateContentText:(NSString *)text;

+ (CGFloat)getCellHeightWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
