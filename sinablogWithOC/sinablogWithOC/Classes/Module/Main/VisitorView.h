//
//  VisitorView.h
//  sinablogWithOC
//
//  Created by ZhangZiang on 15/12/15.
//  Copyright © 2015年 ZhangZiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VisitorViewDelegate <NSObject>

- (void)userWillLogin;

- (void)userWillRegister;

@end

@interface VisitorView : UIView

- (void)visitorWithImage:(NSString *)imageName text:(NSString *)tipLabelText;

@property (nonatomic, weak) id<VisitorViewDelegate> delegate;

@end
