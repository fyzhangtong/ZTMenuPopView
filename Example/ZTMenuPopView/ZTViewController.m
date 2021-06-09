//
//  ZTViewController.m
//  ZTMenuPopView
//
//  Created by fyzhangtong on 06/09/2021.
//  Copyright (c) 2021 fyzhangtong. All rights reserved.
//

#import "ZTViewController.h"
#import <ZTMenuPopView/ZTMenuPopView.h>

@interface ZTViewController ()

@property (nonatomic, strong)     ZTMenuPopView *menuPopView;

@property (nonatomic, strong)     UIView *popView;

@end

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 60, 30);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"显示" forState:UIControlStateNormal];
    [btn setTitle:@"隐藏" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
#pragma mark - getter
- (UIView *)popView
{
    if (!_popView) {
        _popView = [UIView new];
        _popView.backgroundColor = [UIColor redColor];
    }
    return _popView;
}
- (void)buttonClick:(UIButton *)sender
{
    if (sender.isSelected) {
        [self.menuPopView dismissWithCompletion:NULL];
    }else{
        self.menuPopView = [ZTMenuPopView showPopViewAtControl:sender popView:self.popView popViewHeight:180 offsetY:10];
    }
    
}

@end
