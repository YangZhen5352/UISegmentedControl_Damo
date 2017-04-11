//
//  ViewController.m
//  UISegmented_Damo
//
//  Created by 杨振 on 16/6/29.
//  Copyright © 2016年 yangzhen5352. All rights reserved.
//

#import "ViewController.h"
#import "MLKMenuPopover.h"
#import "YZMenuSelectedView.h"

@interface ViewController () // <MLKMenuPopoverDelegate>

//@property (nonatomic, strong) MLKMenuPopover *menuPopover;
//@property (nonatomic, strong) UISegmentedControl *segmentedControl;
//@property (nonatomic, strong) UIView *contentView;
//@property (nonatomic, strong) UIView *moveView;
//@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    [self.view addSubview:self.contentView];
    //    [self.view addSubview:self.moveView];
    //    [self.view addSubview:self.menuPopover];
    
    
    
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
 
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(menuView.frame) + 3, kScreenWidth, ContentViewFrameH)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self.view sendSubviewToBack:btn];
    
}
- (void)btnClick
{
    NSLog(@"________AAAAAAAAAA__________");
}

#pragma mark - MLKMenuPopoverDelegate
//- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
//{
//    [self.segmentedControl setTitle:self.titleArray[selectedIndex] forSegmentAtIndex:3];
//    [UIView animateWithDuration:0.5 animations:^{
//       
//        self.menuPopover.alpha = 0.0;
//    }];
//}
//
//- (UISegmentedControl *)segmentedControl
//{
//    if (!_segmentedControl) {
//        
//        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"综合",@"种植",@"修复",@"更多"]];
//        _segmentedControl.frame = CGRectMake(0, 0, kScreenWidth, ContentViewFrameH);
//        _segmentedControl.tintColor = [UIColor colorWithRed:100 green:100 blue:100 alpha:1.0];
//        _segmentedControl.momentary = YES;
//        NSDictionary *selectDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],
//                                          NSForegroundColorAttributeName,
//                                          kSegmentFont,
//                                          NSFontAttributeName,
//                                          nil];
//        [_segmentedControl setTitleTextAttributes:selectDictionary forState:UIControlStateNormal];
//        [_segmentedControl addTarget:self action:@selector(selectSegmentHandle:) forControlEvents:UIControlEventValueChanged];
////        self.segmentedControl.selectedSegmentIndex = 0;
//    }
//    return _segmentedControl;
//}
//- (void)selectSegmentHandle:(UISegmentedControl *)segmentedControl
//{
//    NSLog(@"--->>>%ld", (long)segmentedControl.selectedSegmentIndex);
//    [UIView animateWithDuration:0.5 animations:^{
//        self.moveView.frame = CGRectMake((kScreenWidth / 4) * (segmentedControl.selectedSegmentIndex), CGRectGetMaxY(self.contentView.frame), kScreenWidth / 4, 3);
//    }];
//    if (segmentedControl.selectedSegmentIndex == 3) {
//        [UIView animateWithDuration:0.5 animations:^{
//           
//            self.menuPopover.alpha = 1.0;
//        }];
//    }
//    else {
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            self.menuPopover.alpha = 0.0;
//        }];
//        [self.segmentedControl setTitle:@"更多" forSegmentAtIndex:3];
//    }
//}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//}
//#pragma mark----------- lazy -------------------
//- (MLKMenuPopover *)menuPopover
//{
//    if (!_menuPopover) {
//        NSArray *titleArray = @[@"更多01", @"更多02", @"更多03", @"更多04", @"更多05", @"更多06"];
//        self.titleArray = titleArray;
//        _menuPopover = [[MLKMenuPopover alloc] initWithFrame:CGRectMake(kScreenWidth/4*3 + 1, CGRectGetMaxY(_segmentedControl.frame) + 153, kScreenWidth/4-2, 150) menuItems:titleArray];
//        _menuPopover.menuPopoverDelegate = self;
//        _menuPopover.layer.masksToBounds = YES;
//        _menuPopover.layer.cornerRadius = 5;
//        _menuPopover.layer.borderColor = RGB(233, 234, 235, 1).CGColor;
//        _menuPopover.layer.borderWidth = 2;
//        _menuPopover.backgroundColor = WHITECOLOR;
//        _menuPopover.alpha = 0.0;
//    }
//    return _menuPopover;
//}
//- (UIView *)moveView
//{
//    if (!_moveView) {
//        _moveView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentView.frame), kScreenWidth / 4, 3)];
//        _moveView.backgroundColor = [UIColor blueColor];
//    }
//    return _moveView;
//}
//- (UIView *)contentView
//{
//    if (!_contentView) {
//        
//        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, ContentViewFrameY, kScreenWidth, ContentViewFrameH)];
//        _contentView.backgroundColor = [UIColor grayColor];
//        [_contentView addSubview:self.segmentedControl];
//    }
//    return _contentView;
//}
//
@end
