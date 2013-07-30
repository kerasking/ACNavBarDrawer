//
//  ACNavBarDrawer.m
//  ACNavBarDrawer
//
//  Created by albert on 13-7-29.
//  Copyright (c) 2013年 albert. All rights reserved.
//

#import "ACNavBarDrawer.h"

#define ACNavBarDrawer_Height       80.f
#define ACNavBarDrawer_Duration     0.3f


@interface ACNavBarDrawer ()
{
    /** 背景遮罩 */
    UIControl               *_mask;
}

@end


@implementation ACNavBarDrawer


#pragma mark - Action Method

- (void)itemBtnPressed:(UIButton *)itemBtn
{
    if (nil != _delegate && [_delegate respondsToSelector:@selector(theBtnPressed:)])
    {
        [self closeNavBarDrawer];
        [_delegate theBtnPressed:itemBtn];
    }
}

- (void)maskTapped
{
    if (nil != _delegate && [_delegate respondsToSelector:@selector(theBGMaskTapped)])
    {
        [self closeNavBarDrawer];
        [_delegate theBGMaskTapped];
    }
}


#pragma mark - Private Methods

- (void)createButtonsByNumber:(NSInteger)number andItemInfoArray:(NSArray *)array
{
    // 每个格子的宽度
    CGFloat barItem_w = (App_Frame_Width / number);
    
    // 每个格子的 中点
    CGFloat barItem_center_y = (ACNavBarDrawer_Height / 2.f);
    
    // button 宽高
    CGFloat btn_w = 40.f;
    CGFloat btn_h = 40.f;
    
    // label 宽高
    CGFloat lab_w = 60.f;
    CGFloat lab_h = 24.f;
    
    // 每个button的中点
    CGFloat btn_center_y = barItem_center_y - (lab_h / 2.f);
    
    // 每个lable的中点
    CGFloat lab_center_y = btn_center_y + ((btn_h + lab_h) / 2.f);
    
    for (NSInteger i = 0; i < number; i++)
    {
        //-- button -------------------------------------------------------------------------------
        UIButton *theBtn = [[UIButton alloc] init];
        [theBtn setBounds:CGRectMake(0.f,
                                     0.f,
                                     btn_w,
                                     btn_h)];
        
        CGFloat item_center_x = i * barItem_w + (barItem_w / 2.f);
        [theBtn setCenter:CGPointMake(item_center_x,
                                      btn_center_y)];
        
        theBtn.tag = i;
        
        [theBtn setBackgroundColor:[UIColor clearColor]];
        
        NSString *imgName = [((NSArray *)[array objectAtIndex:i]) objectAtIndex:0];
        [theBtn setBackgroundImage:PNGIMAGE(imgName) forState:UIControlStateNormal];
        
        [theBtn addTarget:self action:@selector(itemBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:theBtn];
        
        //-- label -------------------------------------------------------------------------------
        UILabel *theLabel = [[UILabel alloc] init];
        [theLabel setBounds:CGRectMake(0.f,
                                       0.f,
                                       lab_w,
                                       lab_h)];
        
        [theLabel setCenter:CGPointMake(item_center_x,
                                        lab_center_y)];
        
        [theLabel setBackgroundColor:[UIColor clearColor]];
        
        [theLabel setFont:[UIFont boldSystemFontOfSize:14.f]];
        [theLabel setTextColor:[UIColor whiteColor]];
        [theLabel setTextAlignment:TextAlignmentCenter];
        
        NSString *labelText = [((NSArray *)[array objectAtIndex:i]) objectAtIndex:1];
        [theLabel setText:labelText];
        
        [self addSubview:theLabel];
    }
}

#pragma mark - Public Methods

- (id)initWithView:(UIView *)theView andItemInfoArray:(NSArray *)theArray
{
    self = [super init];
    if (self)
    {
        // Initialization code
        
        _isOpen = NO;
        
        //-- 遮罩 view -----------------------------------------------------------------------------
        _mask = [[UIControl alloc] initWithFrame:[theView bounds]];
        
        [_mask setBackgroundColor:[UIColor blackColor]];
        [_mask addTarget:self action:@selector(maskTapped) forControlEvents:UIControlEventTouchUpInside];
        [_mask setAlpha:0.0f];
        [theView addSubview:_mask];
        //-----------------------------------------------------------------------------------------;
        
        [self setFrame:CGRectMake(0.f,
                                  -ACNavBarDrawer_Height,
                                  App_Frame_Width,
                                  ACNavBarDrawer_Height)];
        
        [self setBackgroundColor:[UIColor blackColor]];
        
        [self setAlpha:0.5f];
                
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
        self.layer.shadowRadius = 0.5f;
        self.layer.shadowOpacity = 0.8f;
        self.layer.masksToBounds = NO;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
        self.layer.shadowPath = path.CGPath;        
        
        [theView addSubview:self];
        
        //-- 创建按钮 -------------------------------------------------------------------------------
        [self createButtonsByNumber:[theArray count] andItemInfoArray:theArray];
        
    }
    return self;
}

- (void)openNavBarDrawer
{
    _isOpen = YES;
    
    [UIView animateWithDuration:ACNavBarDrawer_Duration animations:^{
        
        [_mask setAlpha:0.3f];
        [self setCenter:CGPointMake( (App_Frame_Width / 2), (ACNavBarDrawer_Height / 2.f) )];
        
    }];
}

- (void)closeNavBarDrawer
{
    _isOpen = NO;
    
    [UIView animateWithDuration:ACNavBarDrawer_Duration animations:^{
        
        [_mask setAlpha:0.f];
        [self setCenter:CGPointMake( (App_Frame_Width / 2), -(ACNavBarDrawer_Height / 2.f) )];
        
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
