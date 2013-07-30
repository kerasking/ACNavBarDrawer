//
//  ACBaseViewController.m
//

#import "ACBaseViewController.h"

#import "UINavigationBar+Background.h"


@interface ACBaseViewController ()
{
    
}

@end


@implementation ACBaseViewController

#pragma mark - Action Methods

- (void)backBtnPressed:(id)sender
{
    if (BVLT_PresentType == self.loadType)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (BVLT_PushType == self.loadType)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"error 未设置 视图控制器 加载方式");
    }
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //-- 导航栏 ------------------------------------------------------------------------------------
    //self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImage *navBarBgImg = [PNGIMAGE(@"nav_bar") stretchableImageWithLeftCapWidth:5.f topCapHeight:22.f];
    [self.navigationController.navigationBar setBackground:navBarBgImg];
    
    //---------------------------------------------------------------------------------------------;
    
    
    //-- 返回按钮 -----------------------------------------------------------------------------------
    if (_doNotNeedBackButton == NO)
    {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setFrame:CGRectMake(0.f, (kTopBarHeight - 20.f) / 2.f, 40.f, 20.f)];
        [backBtn setBackgroundImage:PNGIMAGE(@"nav_back") forState:UIControlStateNormal];
        
        //[backBtn setTitle:@"\t返回" forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        
        [backBtn addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem = backBarItem;
    }
    //---------------------------------------------------------------------------------------------;
    
    
    //-- 背景 --------------------------------------------------------------------------------------
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:PNGIMAGE(@"bg")]];
    [self.view setBackgroundColor:C_BG];
    //---------------------------------------------------------------------------------------------;
}


#pragma mark - Memory Warning Manage Methods

- (void)freeMemoryForReceiveMemoryWarning
{
    // clear memory...
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    // iOS6的特殊处理
    if ( systemVersion >= 6.0f )
    {
        // 保证invisible(保证当前页面是不显示状态), 因为即使在当前界面也会收到系统回调
        if ( [self isViewLoaded] && self.view.window == nil )
        {
            // 做相关的释放操作
            [self freeMemoryForReceiveMemoryWarning];
            
            self.view = nil;   // 确保下次会重新加载
        }
    }
}


#pragma mark - Rotate Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
    else
    {
        return (interfaceOrientation == UIInterfaceOrientationPortrait) ||
        (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
    }
}

#ifdef __IPHONE_6_0
- (BOOL)shouldAutorotate
{
    return NO;
}
#endif


@end
