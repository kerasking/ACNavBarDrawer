//
//  SampleViewController.m
//  ACNavBarDrawer
//
//  Created by albert on 13-7-29.
//  Copyright (c) 2013年 albert. All rights reserved.
//

#import "SampleViewController.h"

#import "ACNavBarDrawer.h"

#import "TestNextViewController.h"

@interface SampleViewController () <ACNavBarDrawerDelegate>
{
    /** 导航栏 按钮 加号 图片 */
    UIImageView *_plusIV;
    
    /** 是否已打开抽屉 */
    BOOL _isOpen;
    
    /** 抽屉视图 */
    ACNavBarDrawer *_drawerView;
}

@end


@implementation SampleViewController


#pragma mark - Action Methods

- (IBAction)testNextVC:(id)sender
{
    // Creat VC
    TestNextViewController *nextVC = [[TestNextViewController alloc] init];
    
    // Push
    nextVC.loadType = BVLT_PushType;
    [self.navigationController pushViewController:nextVC animated:YES];
    
    // Modal
//    nextVC.loadType = BVLT_PresentType;
//    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:nextVC];
//    nc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    
//    [self presentViewController:nc animated:YES completion:nil];
}

- (void)navPlusBtnPressed:(UIButton *)sender
{
    // 如果是关，则开，反之亦然
    if (_drawerView.isOpen == NO)
    {
        [_drawerView openNavBarDrawer];
    }
    else
    {
        [_drawerView closeNavBarDrawer];
    }
    
    [self rotatePlusIV];
}

#pragma mark - Rotate _plusIV

- (void)rotatePlusIV
{
    // 旋转加号按钮
    float angle = _drawerView.isOpen ? -M_PI_4 : 0.0f;
    [UIView animateWithDuration:0.2f animations:^{
        _plusIV.transform = CGAffineTransformMakeRotation(angle);
    }];
}

#pragma mark - ACNavBarDrawerDelegate

-(void)theBtnPressed:(UIButton *)theBtn
{    
    NSInteger btnTag = theBtn.tag;
    
    NSInteger btnNumber = btnTag + 1;
    
    DLog(@"按钮%d被点击", btnNumber);
    
    switch (theBtn.tag)
    {
        case 0:
        {
            
        }
            break;
            
        case 1:
        {
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    // 点完按钮，旋回加号图片
    [self rotatePlusIV];
}

-(void)theBGMaskTapped
{
    // 触摸背景遮罩时，需要通过回调，旋回加号图片
    [self rotatePlusIV];
}


#pragma mark - Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Sample";
    
    [self.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    
    //** barButton *********************************************************************************
    CGFloat navRightBtn_w = 40.f;
    CGFloat navRightBtn_h = 30.f;
    CGFloat navRightBtn_x = App_Frame_Width - 10.f;
    CGFloat navRightBtn_y = (kTopBarHeight - navRightBtn_h) / 2.f;

    UIButton *navRightBtn = [[UIButton alloc] init];
    [navRightBtn setFrame:CGRectMake(navRightBtn_x,
                                     navRightBtn_y,
                                     navRightBtn_w,
                                     navRightBtn_h)];
    
    // 按钮背景图片
    //UIImage *navRightBtnBGImg = PNGIMAGE(@"nav_btn");
    //[navRightBtn setBackgroundImage:navRightBtnBGImg forState:UIControlStateNormal];
    
    
    //-- 按钮上的图片 --------------------------------------------------------------------------------
    CGFloat plusIV_w = 20.f;
    CGFloat plusIV_h = 20.f;
    CGFloat plusIV_x = (navRightBtn.bounds.size.width - plusIV_w) / 2.f;
    CGFloat plusIV_y = (navRightBtn.bounds.size.height - plusIV_h) / 2.f;
    
    _plusIV = [[UIImageView alloc] initWithImage:PNGIMAGE(@"nav_plus")];
    [_plusIV setFrame:CGRectMake(plusIV_x,
                                 plusIV_y,
                                 plusIV_w,
                                 plusIV_h)];
    
    [navRightBtn addSubview:_plusIV];
    //---------------------------------------------------------------------------------------------;
    
    
    // 设置按钮点击时调用的方法
    [navRightBtn addTarget:self action:@selector(navPlusBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:navRightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    //*********************************************************************************************;
    
    
    //** 抽屉 *******************************************************************************
    
    //-- 按钮信息 -------------------------------------------------------------------------------
    // 就不建数据对象了，第一个为图片名、第二个为按钮名
    NSArray *item_01 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮1", nil];
    NSArray *item_02 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮2", nil];
    NSArray *item_03 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮3", nil];
    NSArray *item_04 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮4", nil];
    
    // 最好是 2-5 个按钮，1个很2，5个以上很丑
    NSArray *allItems = [NSArray arrayWithObjects:item_01,item_02,item_03, item_04, nil];
    
    _drawerView = [[ACNavBarDrawer alloc] initWithView:self.view andItemInfoArray:allItems];
    _drawerView.delegate = self;
        
}

- (void)viewWillDisappear:(BOOL)animated
{
    // 消失时 关闭抽屉
    _isOpen = NO;
    [_drawerView closeNavBarDrawer];
    
    // 旋回加号图片
    [self rotatePlusIV];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
