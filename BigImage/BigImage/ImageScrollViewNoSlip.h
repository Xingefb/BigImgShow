//
//  ImageScrollViewNoSlip.h
//  BigImage
//
//  Created by Dzy on 2018/2/5.
//  Copyright © 2018年 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiledImageViewNoSlip.h"

@interface ImageScrollViewNoSlip : UIScrollView
<
UIScrollViewDelegate
>
{
    CGFloat imageScale;
    TiledImageViewNoSlip *frontTiledView;
}

@property (nonatomic ) UIImage *image;
-(id)initWithFrame:(CGRect)frame image:(UIImage*)img;

@end
