//
//  maskButton.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "maskButton.h"
@implementation maskButton

-(instancetype)init{

    self = [super init];

    if (self) {
 
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return self;
}

-(void)setButtonTitle:(NSString *)buttonTitle{

    _buttonTitle = buttonTitle;
    
    [self setTitle:self.buttonTitle forState:UIControlStateNormal];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
