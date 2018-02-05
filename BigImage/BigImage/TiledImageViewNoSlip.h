//
//  TiledImageViewNoSlip.h
//  BigImage
//
//  Created by Dzy on 2018/2/5.
//  Copyright © 2018年 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiledImageViewNoSlip : UIView
{
    CGFloat imageScale;
}
@property (nonatomic ) UIImage *image;
-(id)initWithFrame:(CGRect)_frame image:(UIImage*)img scale:(CGFloat)scale;

@end
