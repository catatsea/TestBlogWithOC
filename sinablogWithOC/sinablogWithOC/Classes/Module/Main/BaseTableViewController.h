//
//  BaseTableViewController.h
//  sinablogWithOC
//
//  Created by ZhangZiang on 15/12/15.
//  Copyright © 2015年 ZhangZiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VisitorView.h"

@interface BaseTableViewController : UITableViewController

@property (nonatomic, weak) VisitorView *visitorView;

@end
