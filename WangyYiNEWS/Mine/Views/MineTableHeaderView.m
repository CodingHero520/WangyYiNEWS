//
//  MineTableHeaderView.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "MineTableHeaderView.h"
#import "Masonry.h"

@interface MineTableHeaderView ()

@property (nonatomic , strong)UIView * maskview;

@end
@implementation MineTableHeaderView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        
        [self addSubview:self.loginButton];
        [self addSubview:self.registerButton];
        [self addSubview:self.maskview];
        
    }

    return self;
}

-(UIButton *)loginButton{

    if (!_loginButton) {
        
        _loginButton = [[UIButton alloc] init];
        
        [_loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
        
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        
        
    }

    return _loginButton;

}
-(UIButton *)registerButton{

    if (!_registerButton) {
        
        _registerButton = [[UIButton alloc] init];
        
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
    
    }

    return _registerButton;
}

-(UIView *)maskview{

    if (!_maskview) {
        
        _maskview = [[UIView alloc] init];
        
        _maskview.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.85];
        
        
    }
    
    return _maskview;

}
-(void)layoutSubviews{

    [super layoutSubviews];

    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(@(45));
        
        make.left.mas_equalTo(@(25));
        
        make.size.mas_equalTo(CGSizeMake(80, 16));
        
    }];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(@(45));
        
        make.right.mas_equalTo(self.mas_right).offset(-25);
        
        make.size.mas_equalTo(CGSizeMake(40, 16));
        
    }];
    
    [_maskview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.left.mas_equalTo(self.mas_left);
        
        make.right.mas_equalTo(self.mas_right);
        
        make.height.mas_equalTo(@(50));
        
        
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
