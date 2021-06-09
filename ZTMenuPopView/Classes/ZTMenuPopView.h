//
//  GuoxueUnitListFilterView.h
//  FanBookClub
//
//  Created by zhangtong on 2020/11/23.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTMenuPopView : UIView

+ (instancetype)showPopViewAtControl:(UIView *)control popView:(UIView *)popView popViewHeight:(CGFloat)popViewHeight offsetY:(CGFloat)offsetY;

- (void)dismissWithCompletion:(void(^_Nullable)(void))dismissComplete;


@end

NS_ASSUME_NONNULL_END
