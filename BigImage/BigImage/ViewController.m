//
//  ViewController.m
//  BigImage
//
//  Created by Dzy on 2018/2/5.
//  Copyright © 2018年 Dzy. All rights reserved.
//

#import "ViewController.h"
#import "ImageScrollViewNoSlip.h"

@interface ViewController ()

@property (nonatomic ) ImageScrollViewNoSlip *scrollView;

@end

@implementation ViewController

- (ImageScrollViewNoSlip *)scrollView {
    
    if (!_scrollView) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *resourcePath = [bundle resourcePath];
        NSString *filePath = [resourcePath stringByAppendingPathComponent:@"中国地图一亿像素.jpg"];
        ImageScrollViewNoSlip *view = [[ImageScrollViewNoSlip alloc] initWithFrame:self.view.bounds image:[UIImage imageWithContentsOfFile:filePath]];
        _scrollView = view;
    }
    return _scrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
