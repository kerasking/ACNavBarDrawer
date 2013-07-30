//
//  UINavigationBar+Background.m
//

#import "UINavigationBar+Background.h"

@implementation UINavigationBar (Background)

- (void)setBackground:(UIImage *)img
{
    // 判断系统版本
	if ( [[[UIDevice currentDevice] systemVersion] doubleValue] >= 5.0 )
    {
        // 修改NavigationBar背景
		if ( [self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
        {
            [self setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        }
	}
    else
    {
        // 背景View
        UIImageView *bgView_ = [[UIImageView alloc] initWithFrame:self.bounds];
        [bgView_ setBackgroundColor:[UIColor whiteColor]];
        [bgView_ setImage:img];
        [self insertSubview:bgView_ atIndex:0];
        //[bgView_ release];    // without ARC
    }
}

@end
