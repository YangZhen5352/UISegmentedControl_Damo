//
//  YZMenuSelectedView.h
//  UISegmented_Damo
//
//  Created by 杨振 on 16/6/29.
//  Copyright © 2016年 yangzhen5352. All rights reserved.

// 使用示范：
/*
     __weak YZMenuSelectedView *menuView = [YZMenuSelectedView shareMenuSelectedManger];
         menuView.frame = CGRectMake(0, ContentViewFrameY, kScreenWidth, ContentViewFrameH);
         menuView.showMenuBlock = ^{
             menuView.frame = CGRectMake(0, ContentViewFrameY, kScreenWidth, ContentViewFrameH + 200);
         };
         menuView.clickMenuIndexBlock = ^(NSInteger menuIndex){
             NSLog(@"menuIndex=>%ld", (long)menuIndex);
         };
     [self.view addSubview:menuView];
     [self.view bringSubviewToFront:menuView];
 */

#import <UIKit/UIKit.h>

#define kSegmentFont [UIFont fontWithName:@"Courier-Bold" size:16] //分段控制器字号
#define ContentViewFrameY 200
#define ContentViewFrameH 38
#define kScreenWidth self.view.bounds.size.width
#define kViewWidth [UIScreen mainScreen].bounds.size.width

typedef enum{
    kMenuIndex00 = 0,
    kMenuIndex01 = 1,
    kMenuIndex02 = 2,
    kMenuIndex03 = 3,
    kMenuIndex04 = 4, // 更多按钮：什么也不干
    kMenuIndex05 = 5,
    kMenuIndex06 = 6,
    kMenuIndex07 = 7,
    kMenuIndex08 = 8,
    kMenuIndex09 = 9,
} ClickMenuEnum;

// 设置显示时View的frame大小
typedef void (^ShowMenuBlock)();
// 点击按钮的index
typedef void (^ClickMenuIndexBlock)(NSInteger menuIndex);
@interface YZMenuSelectedView : UIView

@property (nonatomic, strong) ShowMenuBlock showMenuBlock;
@property (nonatomic, strong) ClickMenuIndexBlock clickMenuIndexBlock;
+ (instancetype)shareMenuSelectedManger;
@end
