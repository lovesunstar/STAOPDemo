//
//  ViewController.m
//  STAOPDemo
//
//  Created by SunJiangting on 14-10-23.
//  Copyright (c) 2014年 Suen. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>


@interface UIView (STSwizzle)

- (instancetype) st_initWithFrame:(CGRect) frame;

@end

@implementation UIView (STSwizzle)

+ (void) load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithFrame:)), class_getInstanceMethod(self, @selector(st_initWithFrame:)));
}

- (instancetype) st_initWithFrame:(CGRect) frame {
    NSLog(@"===before invoke initWithFrame==");
    id instance = [self st_initWithFrame:frame];
    NSLog(@"===after invoke initWithFrame==");
    return instance;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView * view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
