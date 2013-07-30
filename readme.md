# ACNavBarDrawer
--------------------

导航栏抽屉视图

<img src="https://github.com/albertgh/ACNavBarDrawer/raw/master/screenshot.gif"/>


# 使用方式

1) 把 ACNavBarDrawer.h 和 ACNavBarDrawer.m 拖到项目中.  添加 QuartzCore.framework 框架

    #import "ACNavBarDrawer.h"
    
    m文件里顺手用了几个常用宏。。请 command 过去 自行拷贝～ 就不单独写了
	

2) 创建 ACNavBarDrawer
	
    //-- 先创建按钮信息 -------------------------------------------------------------------------------
    // 就不建数据对象了，第一个为图片名、第二个为按钮名
    NSArray *item_01 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮1", nil];
    NSArray *item_02 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮2", nil];
    NSArray *item_03 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮3", nil];
    NSArray *item_04 = [NSArray arrayWithObjects:@"drawer_msg", @"按钮4", nil];
    
    // 最好是 2-5 个按钮，1个很2，5个以上很丑
    NSArray *allItems = [NSArray arrayWithObjects:item_01,item_02,item_03, item_04, nil];
    
    _drawerView = [[ACNavBarDrawer alloc] initWithView:self.view andItemInfoArray:allItems];
       
    

3) 调用方式
	
	// 打开抽屉
    [_drawerView openNavBarDrawer];

    // 收起抽屉
    [_drawerView closeNavBarDrawer];
   
    

4) 代理回调

 	// 实现 <ACNavBarDrawerDelegate> 协议

	_drawerView.delegate = self;

 	// 加上回调方法

 	#pragma mark - ACNavBarDrawerDelegate

 	// 抽屉上按钮的回调
	-(void)theBtnPressed:(UIButton *)theBtn
	{    
	    NSInteger btnTag = theBtn.tag;
	    
	    switch (theBtn.tag)
	    {
	        case 0:
	        {
	            
	        }
	            break;
	            
	        // ... 此处省略

	        default:
	            break;
	    }
	}

	// 背景遮罩触摸响应 的回调 （非必须）
	-(void)theBGMaskTapped
	{

	}



## 其他说明

* ARC - 项目使用了 ARC. 如果你是MRC项目, 给 ACNavBarDrawer.m 加上 '-fobjc-arc' 标识。
* XCode 4.4 以上 (auto-synthesis required)



## LICENSE

MIT


