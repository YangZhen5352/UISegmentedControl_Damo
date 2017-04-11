//
//  YZMenuSelectedView.m
//  UISegmented_Damo
//
//  Created by 杨振 on 16/6/29.
//  Copyright © 2016年 yangzhen5352. All rights reserved.
//

#import "YZMenuSelectedView.h"
#import "MLKMenuPopover.h"

@interface YZMenuSelectedView() <MLKMenuPopoverDelegate>

@property (nonatomic, strong) MLKMenuPopover *menuPopover;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *moveView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *moreTitleArray;
@property (nonatomic,assign) NSInteger titleCount;


@end

@implementation YZMenuSelectedView

+ (instancetype)shareMenuSelectedManger {
    static id instance;
    static dispatch_once_t onceToKen;
    
    dispatch_once(&onceToKen, ^{
        instance = [[self alloc] init];

    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.moreTitleArray = @[@"更多01", @"更多02", @"更多03", @"更多04", @"更多05"];
        self.titleArray = @[@"综合", @"种植",@"修复",@"更多"];
        self.titleCount = self.titleArray.count;
        
        [self addSubview:self.contentView];
        [self addSubview:self.moveView];
        [self addSubview:self.menuPopover];
    }
    return self;
}
#pragma mark - MLKMenuPopoverDelegate
- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
{
    [self.segmentedControl setTitle:self.moreTitleArray[selectedIndex] forSegmentAtIndex: (self.titleCount - 1)];
    [UIView animateWithDuration:0.5 animations:^{
        self.menuPopover.alpha = 0.0;
    }];
    if (self.clickMenuIndexBlock) {
        self.clickMenuIndexBlock(selectedIndex + (self.titleCount - 1));
    }
    self.frame = CGRectMake(0, ContentViewFrameY, kViewWidth, ContentViewFrameH);
}

- (void)selectSegmentHandle:(UISegmentedControl *)segmentedControl
{
    if (self.clickMenuIndexBlock) {
        if (segmentedControl.selectedSegmentIndex != (self.titleCount - 1)) {
          self.clickMenuIndexBlock(segmentedControl.selectedSegmentIndex);
        }
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.moveView.frame = CGRectMake((kViewWidth / self.titleCount) * (segmentedControl.selectedSegmentIndex), CGRectGetMaxY(self.contentView.frame), kViewWidth / self.titleCount, (self.titleCount - 1));
    }];
    if (segmentedControl.selectedSegmentIndex == (self.titleCount - 1)) {
        [UIView animateWithDuration:0.5 animations:^{
            self.menuPopover.alpha = 1.0;
        }];
        if (self.showMenuBlock) {
            self.showMenuBlock();
        }
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            self.menuPopover.alpha = 0.0;
        }];
        [self.segmentedControl setTitle:@"更多" forSegmentAtIndex: (self.titleCount - 1)];
        self.frame = CGRectMake(0, ContentViewFrameY, kViewWidth, ContentViewFrameH);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5 animations:^{
        self.menuPopover.alpha = 0.0;
    }];
    self.frame = CGRectMake(0, ContentViewFrameY, kViewWidth, ContentViewFrameH);
}
#pragma mark----------- lazy -------------------
- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl) {
        
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:self.titleArray];
        _segmentedControl.frame = CGRectMake(0, 0, kViewWidth, ContentViewFrameH);
        _segmentedControl.tintColor = RGB(200, 200, 200, 1.0);
        _segmentedControl.momentary = YES; // 允许重复点击
        NSDictionary *selectDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIColor orangeColor],
                                          NSForegroundColorAttributeName,
                                          kSegmentFont,
                                          NSFontAttributeName,
                                          nil];
        [_segmentedControl setTitleTextAttributes:selectDictionary forState:UIControlStateNormal];
        [_segmentedControl addTarget:self action:@selector(selectSegmentHandle:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}
- (MLKMenuPopover *)menuPopover
{
    if (!_menuPopover) {
        _menuPopover = [[MLKMenuPopover alloc] initWithFrame:CGRectMake(
                                kViewWidth/self.titleCount * (self.titleCount - 1) + 1,
                                CGRectGetMaxY(_contentView.frame) + (self.titleCount - 1),
                                kViewWidth/self.titleCount - 2,
                                150
                                ) menuItems:self.moreTitleArray];
        _menuPopover.menuPopoverDelegate = self;
        _menuPopover.layer.masksToBounds = YES;
        _menuPopover.layer.cornerRadius = 5;
        _menuPopover.layer.borderColor = RGB(233, 234, 235, 1).CGColor;
        _menuPopover.layer.borderWidth = 2;
        _menuPopover.backgroundColor = WHITECOLOR;
        _menuPopover.alpha = 0.0;
    }
    return _menuPopover;
}
- (UIView *)moveView
{
    if (!_moveView) {
        _moveView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentView.frame), kViewWidth / self.titleCount, (self.titleCount - 1))];
        _moveView.backgroundColor = [UIColor blueColor];
    }
    return _moveView;
}
- (UIView *)contentView
{
    if (!_contentView) {
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, ContentViewFrameH)];
        _contentView.backgroundColor = [UIColor grayColor];
        [_contentView addSubview:self.segmentedControl];
    }
    return _contentView;
}
@end
