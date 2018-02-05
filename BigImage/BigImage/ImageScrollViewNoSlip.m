//
//  ImageScrollViewNoSlip.m
//  BigImage
//
//  Created by Dzy on 2018/2/5.
//  Copyright © 2018年 Dzy. All rights reserved.
//

#import "ImageScrollViewNoSlip.h"

@implementation ImageScrollViewNoSlip

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return frontTiledView;
}

-(id)initWithFrame:(CGRect )frame image:(UIImage* )img {
    if((self = [super initWithFrame:frame])) {
        // Set up the UIScrollView
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.delegate = self;
//        self.backgroundColor = [UIColor colorWithRed:0.4f green:0.2f blue:0.2f alpha:1.0f];
        
        // 根据图片实际尺寸和屏幕尺寸计算图片视图的尺寸
        self.image = img;
        CGRect imageRect = CGRectMake(
                                      0.0f,
                                      0.0f,
                                      CGImageGetWidth(img.CGImage),
                                      CGImageGetHeight(img.CGImage));
        imageScale = self.frame.size.width/imageRect.size.width;
        
        imageRect.size = CGSizeMake(
                                    imageRect.size.width*imageScale,
                                    imageRect.size.height*imageScale);
        
        //根据图片的缩放计算scrollview的缩放级别
        // 图片相对于视图放大了1/imageScale倍，所以用log2(1/imageScale)得出缩放次数，
        // 然后通过pow得出缩放倍数，至于为什么要加1，
        // 是希望图片在放大到原图比例时，还可以继续放大一次（即2倍），可以看的更清晰
        int level = ceil(log2(1/imageScale))+1;
        CGFloat zoomOutLevels = 1;
        CGFloat zoomInLevels = pow(2, level);
        
        self.maximumZoomScale =zoomInLevels;
        self.minimumZoomScale = zoomOutLevels;
        
        frontTiledView = [[TiledImageViewNoSlip alloc] initWithFrame:imageRect
                                                               image:img
                                                               scale:imageScale];
        [self addSubview:frontTiledView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
