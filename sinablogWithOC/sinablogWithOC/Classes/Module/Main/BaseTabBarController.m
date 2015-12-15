//
//  BaseTabBarController.m
//  sinablogWithOC
//
//  Created by ZhangZiang on 15/12/15.
//  Copyright © 2015年 ZhangZiang. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
#import "BaseTabBar.h"

@implementation BaseTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setValue:[[BaseTabBar alloc]init] forKey:@"tabBar"];
    
    [self loadChlidView];
    

}

- (void)loadChlidView
{
    [self setupChildViewControllers:[[HomeTableViewController alloc]init] title:@"首页" imageName:@"tabbar_home"];
    [self setupChildViewControllers:[[MessageTableViewController alloc]init] title:@"消息" imageName:@"tabbar_message_center"];
    [self setupChildViewControllers:[[DiscoverTableViewController alloc]init] title:@"发现" imageName:@"tabbar_discover"];
    [self setupChildViewControllers:[[ProfileTableViewController alloc]init] title:@"我" imageName:@"tabbar_profile"];
}

- (void)setupChildViewControllers:(UITableViewController *)vc title:(NSString *)title imageName:(NSString *)imageName;
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.navigationBar.tintColor = [UIColor orangeColor];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    [self addChildViewController:nav];
}




@end
