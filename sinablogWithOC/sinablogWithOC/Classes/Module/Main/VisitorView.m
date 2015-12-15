//
//  VisitorView.m
//  sinablogWithOC
//
//  Created by ZhangZiang on 15/12/15.
//  Copyright © 2015年 ZhangZiang. All rights reserved.
//

#import "VisitorView.h"

@interface VisitorView ()

@property (nonatomic, weak) UIImageView *centerImage;
@property (nonatomic, weak) UIImageView *centerHouse;
@property (nonatomic, weak) UILabel *tipLabel;

@end

@implementation VisitorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    [self setupUI];
  
    return self;
}

- (void)visitorWithImage:(NSString *)imageName text:(NSString *)tipLabelText
{
    self.tipLabel.text = tipLabelText;
    //因为已经设置了默认图片为Home,所以Home传nil
    if (imageName) {
        //不是Home
        self.centerImage.image = [UIImage imageNamed:imageName];
        //隐藏房子
        self.centerHouse.hidden = YES;
        //把中间的图片移动上面
        [self bringSubviewToFront:self.centerImage];
    }
    else
    {
        self.centerHouse.hidden = NO;
    }
}

#pragma mark 代理,为了按钮去调用控制器,所以用代理
- (void)loginBtnClicked
{
    if ([self.delegate respondsToSelector:@selector(userWillLogin)]) {
        
        [self.delegate userWillLogin];
    }
}

- (void)registerBtnClicked
{
    if ([self.delegate respondsToSelector:@selector(userWillRegister)]) {
        
        [self.delegate userWillRegister];
    }
}

#pragma mark 设置UI
- (void)setupUI
{
    
    //中间的图片
    UIImageView *centerImage = [[UIImageView alloc]init];
    self.centerImage = centerImage;
    //加入subview(注意有顺序)
     [self addSubview:self.centerImage];
    
    centerImage.image = [UIImage imageNamed:@"visitordiscover_feed_image_smallicon"];
    [centerImage sizeToFit];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:centerImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:centerImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-60]];
    
    //在这里定义背景图片,以覆盖上面的圆圈
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_mask_smallicon"]];
    [self addSubview:backImage];
    
    //中间的房子
    UIImageView *centerHouse = [[UIImageView alloc]init];
    self.centerHouse = centerHouse;
    //加入subview(注意有顺序)
    [self addSubview:self.centerHouse];
    
    centerHouse.image = [UIImage imageNamed:@"visitordiscover_feed_image_house"];
    [centerHouse sizeToFit];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:centerHouse attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:centerImage attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:centerHouse attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:centerImage attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];

    //图片下面的tip
    UILabel *tipLabel = [[UILabel alloc]init];
    //加入subview(注意有顺序)
    [self addSubview:tipLabel];
    self.tipLabel = tipLabel;
    
    tipLabel.text = @"关注一些人，回这里看看有什么惊喜,关注一些人，回这里看看有什么惊喜";
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.numberOfLines = 0;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tipLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:centerImage attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tipLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tipLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tipLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:240]];
    
    //tip下面的登录按钮
    UIButton *loginBtn = [[UIButton alloc]init];
    //加入subview(注意有顺序)
    [self addSubview:loginBtn];
    
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //增加按钮的点击事件
    [loginBtn addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tipLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:tipLabel attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];

    //tip下面的注册按钮
    UIButton *registerBtn = [[UIButton alloc]init];
    //加入subview(注意有顺序)
    [self addSubview:registerBtn];
    
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //增加按钮的点击事件
    [registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:registerBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tipLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:registerBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:tipLabel attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:registerBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:registerBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    
    //还有一个背景图片
   
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[backImage]-0-|" options:0 metrics:nil views:@{@"backImage" : backImage}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backImage]-(-35)-[reg]" options:0 metrics:nil views:@{@"backImage" : backImage, @"reg" : registerBtn}]];
    
    //调整一下背景颜色
    self.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    
    [self cancellAutoResizing];
}

- (void)cancellAutoResizing
{
    for (UIView *subview in self.subviews) {
        subview.translatesAutoresizingMaskIntoConstraints = NO;
    }
}

@end
