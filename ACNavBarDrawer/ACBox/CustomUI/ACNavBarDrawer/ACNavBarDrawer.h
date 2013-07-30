//
//  ACNavBarDrawer.h
//  ACNavBarDrawer
//
//  Created by albert on 13-7-29.
//  Copyright (c) 2013年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 抽屉视图 委托协议 */
@protocol ACNavBarDrawerDelegate <NSObject>

@required
/** 关闭按钮 代理回调方法 */
-(void)theBtnPressed:(UIButton *)theBtn;

@optional
/** 触摸背景 遮罩 代理回调方法 */
-(void)theBGMaskTapped;

@end


@interface ACNavBarDrawer : UIView

/** 抽屉视图 代理 */
@property (nonatomic, assign) id <ACNavBarDrawerDelegate> delegate;


/** 抽屉视图是否已打开 */
@property (nonatomic) BOOL isOpen;


/**
 * 实例化抽屉视图
 * @param theView 指定的UIView
 */
- (id)initWithView:(UIView *)theView andItemInfoArray:(NSArray *)theArray;

/**
 * 打开抽屉
 */
- (void)openNavBarDrawer;

/**
 * 关起抽屉
 */
- (void)closeNavBarDrawer;

@end
