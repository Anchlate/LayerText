//
//  ViewController.m
//  LayerText
//
//  Created by Qianrun on 17/1/16.
//  Copyright © 2017年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import "ANTextLayout.h"
#import "ANTextView.h"

@interface ViewController ()
@property (nonatomic, strong)ANTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    ANTextLayout *contentTextLayout = [[ANTextLayout alloc] init];
    contentTextLayout.text = @"asfasdasdasdasdasdasdasdasdsdfklajksdflajksdklfahsdjlkfhjasdjklfhjsakdfjbansdf";
//    contentTextLayout.font = [UIFont systemFontOfSize:15.0f];
//    contentTextLayout.textColor = [UIColor blackColor];
    contentTextLayout.boundsRect = CGRectMake(60.0f, 50.0f, self.view.frame.size.width - 80.f, MAXFLOAT);
//    contentTextLayout.linespace = 2.0f;
    [contentTextLayout createFrame];
    
    self.textView = [ANTextView new];
    self.textView.textLayout = contentTextLayout;
    self.textView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    self.textView.center = self.view.center;
    
    self.textView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
