//
//  UIAlertView+Blocks.h
//  ACLoadingView
//
//  Created by Apple on 13-7-25.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

//用typedef定义DismissBlock和CancelBlock
typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();

@interface UIAlertView (Blocks)

//方法定义
+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      otherButtonTitles:(NSArray*)otherButtons
                              onDismiss:(DismissBlock)dismissed
                               onCancel:(CancelBlock)cancelled;

@end
