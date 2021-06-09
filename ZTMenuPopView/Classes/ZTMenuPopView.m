//
//  GuoxueUnitListFilterView.m
//  FanBookClub
//
//  Created by zhangtong on 2020/11/23.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ZTMenuPopView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#pragma mark - GuoxueUnitListFilterView

@interface ZTMenuPopView ()

@property (nonatomic, weak)       UIView *popView;
@property (nonatomic, weak)       UIView *control;
@property (nonatomic, strong)     UIView *tapView;

@end

@implementation ZTMenuPopView
#pragma mark - getter
- (UIView *)tapView
{
    if (!_tapView) {
        UIView *tapView = [UIView new];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [tapView addGestureRecognizer:tap];
        [self addSubview:tapView];
        _tapView = tapView;
    }
    return _tapView;
}
#pragma mark - show & dismiss
+ (instancetype)showPopViewAtControl:(UIView *)control popView:(UIView *)popView popViewHeight:(CGFloat)popViewHeight offsetY:(CGFloat)offsetY
{
    /// 获取y坐标
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect rect = [control.superview convertRect:control.frame toView:window];
    CGFloat y = rect.origin.y + control.bounds.size.height + offsetY;
    
    /// 初始化
    ZTMenuPopView *menuPopView = [ZTMenuPopView new];
    menuPopView.frame = CGRectMake(0, y, ScreenW, ScreenH - y);
    menuPopView.tapView.frame = menuPopView.bounds;
    menuPopView.layer.masksToBounds = YES;
    menuPopView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    menuPopView.control = control;
    menuPopView.popView = popView;
    
    popView.frame = CGRectMake(0, 0, ScreenW, 0);
    if ([control isKindOfClass:UIControl.class]) {
        ((UIControl *)control).selected = YES;
    }
    /// add view
    [menuPopView addSubview:popView];
    [window addSubview:menuPopView];
    [UIView animateWithDuration:0.3 animations:^{
        popView.frame = CGRectMake(0, 0, ScreenW, popViewHeight);
    } completion:^(BOOL finished) {
    }];
    
    return menuPopView;
}
- (void)tapAction
{
    [self dismissWithCompletion:NULL];
}
- (void)dismissWithCompletion:(void(^_Nullable)(void))dismissComplete;
{
    [UIView animateWithDuration:0.3 animations:^{
        self.popView.frame = CGRectMake(0, 0, ScreenW, 0);
        if ([self.control isKindOfClass:UIControl.class]) {
            ((UIControl *)self.control).selected = NO;
        }
    } completion:^(BOOL finished) {
        !dismissComplete ? : dismissComplete();
        [self.popView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
