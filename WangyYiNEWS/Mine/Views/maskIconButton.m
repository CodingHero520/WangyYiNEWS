//
//  maskIconButton.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "maskIconButton.h"
#import "UIImage+ImageContnerRadius.h"
@implementation maskIconButton

-(instancetype)init{

    self = [super init];

    if (self) {
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 20;
    }
    
    return self;

}
-(void)setBgcolor:(UIColor *)bgcolor{

    _bgcolor = bgcolor;
    
    self.backgroundColor = bgcolor;

}
-(void)setRadius:(CGFloat)radius{

    _radius = radius;
    
}
-(void)setMaskimage:(NSString *)maskimage{

    _maskimage = maskimage;
    
    self.imageView.image = [[UIImage imageNamed:maskimage]solveImageWithCornerRadius:self.radius];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
