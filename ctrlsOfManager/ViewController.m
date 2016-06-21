//
//  ViewController.m
//  ctrlsOfManager
//
//  Created by SkyAndSea on 16/6/13.
//  Copyright © 2016年 SkyAndSea. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import "secondViewController.h"
@interface ViewController ()
{
    firstViewController *_firstVc;
    secondViewController *_secondVc;
    UIView *_redLine;
    UIButton *_segmentBtn;
    UIView *_selectView;


}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

//创建子控制器管理控件
[self createChildVcCtr];
//    创建子控制器
//    [self createChildVC];
}
//
//- (void)createChildVC
//{
//
//    _firstVc = [[firstViewController alloc] init];
//    _firstVc.view.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
//    [self addChildViewController:_firstVc];
//    [self.view addSubview:_firstVc.view];
//
//
//    
//    _secondVc = [[secondViewController alloc] init];
//    _secondVc.view.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
//    [self addChildViewController:_secondVc];
//    [self.view addSubview:_secondVc.view];
//    
//}

- (void)createChildVcCtr
{
    _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    _selectView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_selectView];
    
    for (NSUInteger i = 0; i < 2; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width * i * 0.5, 0, self.view.frame.size.width * 0.5, 40)];
        btn.tag = i;
        [btn setTitle:(i == 0)?@"diyige":@"dierge" forState:UIControlStateNormal];
        [_selectView addSubview:btn];
        
    }
    
//    创建初始化红色的线
    _redLine = [[UIView alloc] initWithFrame:CGRectMake(0, 37, self.view.frame.size.width * 0.5, 3)];
    _redLine.backgroundColor = [UIColor redColor];
    [_selectView addSubview:_redLine];
    
}

- (void)clickBtn:(UIButton *)sender
{

    if (sender.tag == 0) {
        [UIView animateWithDuration:0.2 animations:^{
//            点击左边的按钮红线的位置
            _redLine.frame = CGRectMake(0, 37, self.view.frame.size.width, 3);
            
        } completion:^(BOOL finished) {
//            显示第一个控制器，隐藏第二个控制器
            [_firstVc removeFromParentViewController];
            [self addChildViewController:_secondVc];
            
            
        }];
        
        
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            //            点击左边的按钮红线的位置
            _redLine.frame = CGRectMake(self.view.frame.size.width * 0.5, 37, self.view.frame.size.width, 3);
            
        } completion:^(BOOL finished) {
            //            显示第一个控制器，隐藏第二个控制器
            [_secondVc removeFromParentViewController];
            [self addChildViewController:_firstVc];
            
        }];
    
    }


}



@end
