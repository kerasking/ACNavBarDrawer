//
//  ACBaseViewController.h
//

#import <UIKit/UIKit.h>


/** ViewController 的 加载方式 */
enum EM_BaseVC_LoadType
{
    BVLT_PushType           = 333127,
    BVLT_PresentType        = 333128
};


@interface ACBaseViewController : UIViewController

/** 视图控制器加载类型 */
@property (nonatomic) NSInteger loadType;

/** 是否需要返回按钮 */
@property (nonatomic) BOOL doNotNeedBackButton;


/**
 * 导航栏返回按钮事件
 * @return 无
 * @param sender UIButton *
 */
- (void)backBtnPressed:(id)sender;

@end
