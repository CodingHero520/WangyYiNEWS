//
//  UIImage+ImageContnerRadius.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "UIImage+ImageContnerRadius.h"

@implementation UIImage (ImageContnerRadius)
-(UIImage *)solveImageWithCornerRadius:(CGFloat)radius
{
    //第三种方法:使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
    CGRect rect = (CGRect){0.f,0.f,self.size};
    
    //配置参数
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    
    
    //添加路径
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    
    //进行切割
    CGContextClip(UIGraphicsGetCurrentContext());
    
    //开始绘制
    [self drawInRect:rect];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndPDFContext();
    
    return image;
    
}

@end
