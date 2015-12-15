//
//  BaseTableViewController.m
//  sinablogWithOC
//
//  Created by ZhangZiang on 15/12/15.
//  Copyright © 2015年 ZhangZiang. All rights reserved.
//

#import "BaseTableViewController.h"


@interface BaseTableViewController ()<VisitorViewDelegate>

@property (nonatomic, assign) BOOL isUserLogined;

@end

@implementation BaseTableViewController

- (void)loadView
{
    if (self.isUserLogined) {
        [super loadView];
    }
    else
    {
        [self loadVisitorView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)loadVisitorView
{
    VisitorView *view = [[VisitorView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.visitorView = view;
//    view.frame = self.view.frame;
    self.view = view;
    
    //设置代理
    view.delegate = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(userWillLogin)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(userWillRegister)];
}

- (void)userWillLogin
{
    NSLog(@"userlogin");
}

- (void)userWillRegister
{
    NSLog(@"userRegister");
}

@end
