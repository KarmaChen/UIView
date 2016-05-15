//
//  ViewController.m
//  UIView
//
//  Created by Karma on 16/5/15.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_superView;
    UIView *_subView;
}
@property (weak, nonatomic) IBOutlet UIView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIView的初始化
//    _superView=[[UIView alloc]init];
//    _superView.frame=CGRectMake(50, 50, 100, 100);
//    _superView.backgroundColor=[UIColor yellowColor];
//    [self.view addSubview:_superView];
    //添加手势
    //添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
    [self.myView addGestureRecognizer:longPress];
    
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.myView addGestureRecognizer:tap];
    
}
//UIView的形变
- (IBAction)move:(id)sender {
    CGPoint point = self.myView.center;
    point.y +=10;
    self.myView.center = point;
}
- (IBAction)change:(id)sender {
    self.myView.transform = CGAffineTransformScale(self.myView.transform, 1.1, 1.1);
}
- (IBAction)rotating:(id)sender {
    self.myView.transform = CGAffineTransformRotate(self.myView.transform,M_PI_4);
}
- (IBAction)reset:(id)sender {
    self.myView.transform = CGAffineTransformIdentity;
}
//UIView的动画
- (IBAction)Animation:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        self.myView.backgroundColor=[UIColor blackColor];
         self.myView.transform = CGAffineTransformScale(self.myView.transform, 2,2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.myView.backgroundColor = [UIColor greenColor];
            self.myView.transform = CGAffineTransformIdentity;
        }];
    }];
}
//用户交互事件(手势)
-(void)longPressAction{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"长按了" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

-(void) tapAction {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击了" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
