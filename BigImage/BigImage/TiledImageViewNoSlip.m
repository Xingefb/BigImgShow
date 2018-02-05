//
//  TiledImageViewNoSlip.m
//  BigImage
//
//  Created by Dzy on 2018/2/5.
//  Copyright © 2018年 Dzy. All rights reserved.
//

#import "TiledImageViewNoSlip.h"

@implementation TiledImageViewNoSlip

+ (Class)layerClass {
    return [CATiledLayer class];
}

-(id)initWithFrame:(CGRect)_frame image:(UIImage*)image scale:(CGFloat)scale {
    if ((self = [super initWithFrame:_frame])) {
        self.image = image;
//        CGRect imageRect = CGRectMake(0.0f, 0.0f,
//                               CGImageGetWidth(image.CGImage),
//                               CGImageGetHeight(image.CGImage));
        imageScale = scale;
        CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
        //根据图片的缩放计算scrollview的缩放次数
        // 图片相对于视图放大了1/imageScale倍，所以用log2(1/imageScale)得出缩放次数，
        // 然后通过pow得出缩放倍数，至于为什么要加1，
        // 是希望图片在放大到原图比例时，还可以继续放大一次（即2倍），可以看的更清晰
        int lev = ceil(log2(1/scale))+1;
        tiledLayer.levelsOfDetail = 1;
        tiledLayer.levelsOfDetailBias = lev;
        //        tiledLayer.tileSize  此处tilesize使用默认的256x256即可
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    //将视图frame映射到实际图片的frame
    CGRect rec = CGRectMake(
                            rect.origin.x / imageScale,
                            rect.origin.y / imageScale,
                            rect.size.width / imageScale,
                            rect.size.height / imageScale
                            );
    //截取指定图片区域，重绘
    CGImageRef cropImg = CGImageCreateWithImageInRect(self.image.CGImage, rec);
    UIImage *tileImg = [UIImage imageWithCGImage:cropImg];
    [tileImg drawInRect:rect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
