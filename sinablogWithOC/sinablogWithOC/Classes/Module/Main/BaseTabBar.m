//
//  BaseTabBar.m
//  sinablogWithOC
//
//  Created by ZhangZiang on 15/12/15.
//  Copyright © 2015年 ZhangZiang. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar()

@property (nonatomic, strong) UIButton *centerBtn;

@end

@implementation BaseTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self addSubview:self.centerBtn];
    return self;
}
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    return [super initWithCoder:aDecoder];
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupSubViewFrame];
    
    self.tintColor = [UIColor orangeColor];

}

- (void)setupSubViewFrame
{
    int index = 0;
    
    CGFloat w = self.bounds.size.width/5;
    CGFloat h = self.bounds.size.height;
    
    for (UIView *subview in self.subviews) {
        
        Class class = NSClassFromString(@"UITabBarButton");
        if ([subview isKindOfClass:class]) {
            
            subview.frame = CGRectMake(w * index, 0, w, h);
            
            index += index == 1? 2 : 1;
            
        }
    }
    
    self.centerBtn.frame = CGRectMake(w*2, 0, w, h);

}

- (UIButton *)centerBtn
{
    if (_centerBtn == nil) {
        _centerBtn = [[UIButton alloc]init];
        
        [_centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [_centerBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_centerBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [_centerBtn sizeToFit];

    }
    return _centerBtn;
}

@end
