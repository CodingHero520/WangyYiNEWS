//
//  PersonPannelView.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "PersonPannelView.h"
#import "maskButton.h"
#import "Masonry.h"

#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define BUTTONWIDTH KWIDTH/3
@interface PersonPannelView ()

@property (nonatomic ,strong)maskButton * saveButton;
@property (nonatomic ,strong)maskButton * historyButton;
@property (nonatomic ,strong)maskButton * tieButton;

@property (nonatomic , strong)UIButton * signButton;
@property (nonatomic , strong)UIView * separateLine;
@end
@implementation PersonPannelView

-(instancetype)initWithFrame:(CGRect)frame{

   self = [super initWithFrame:frame];

    if (self) {
        
        [self addSubview:self.saveButton];
        [self addSubview:self.historyButton];
        [self addSubview:self.tieButton];
        
        [self addSubview:self.YIButton];
        [self addSubview:self.WXButton];
        [self addSubview:self.SinaButton];
        [self addSubview:self.QQButton];
        
        [self addSubview:self.signButton];
        
        [self addSubview:self.separateLine];

        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        //登录成功之后
        [self addSubview:self.loginPersonImage];
        [self addSubview:self.loginPersonLabel];
        [self addSubview:self.loginPersonRank];
        
        self.loginPersonImage.hidden = YES;
        self.loginPersonLabel.hidden = YES;
        self.loginPersonRank.hidden = YES;
        
        
    }
    return self;
    
}
-(UIButton *)loginPersonImage{

    if (!_loginPersonImage) {
        
        _loginPersonImage = [[UIButton alloc] init];
        _loginPersonImage.layer.masksToBounds = YES;
        _loginPersonImage.layer.cornerRadius = 20;
        _loginPersonImage.backgroundColor = [UIColor greenColor];
        
    }
    
    return _loginPersonImage;

}
-(UILabel *)loginPersonLabel{


    if (!_loginPersonLabel) {
     
        _loginPersonLabel = [[UILabel alloc] init];
        _loginPersonLabel.font = [UIFont systemFontOfSize:17 weight:1];
//        _loginPersonLabel.text = @"有态度网友071RJ";
        _loginPersonLabel.textColor = RGBCOLOR(62, 62, 62, 1);
    }
    return _loginPersonLabel;

}
-(UILabel *)loginPersonRank{

    if (!_loginPersonRank) {
     
        _loginPersonRank = [[UILabel alloc] init];
        _loginPersonRank.font = [UIFont systemFontOfSize:10];
//        _loginPersonRank.text = @"跟贴局科员";
        _loginPersonRank.textColor = [UIColor lightGrayColor];
    }
    return _loginPersonRank;

}

-(maskButton *)saveButton
{

    if (!_saveButton) {
        
        _saveButton = [[maskButton alloc] init];
        
        _saveButton.buttonTitle = @"收藏";
        
    }
    return _saveButton;

}

-(maskButton *)historyButton{

    if (!_historyButton) {
        
        _historyButton = [[maskButton alloc] init];
        
        _historyButton.buttonTitle = @"历史";
    }
    
    return _historyButton;

}
-(maskButton *)tieButton{

    if (!_tieButton) {
        
        _tieButton = [[maskButton alloc] init];
        
        _tieButton.buttonTitle = @"跟贴";
    }
    
    return _tieButton;

}
-(maskIconButton *)YIButton{

    if (!_YIButton) {
        
        _YIButton = [[maskIconButton alloc] init];
        
        _YIButton.bgcolor = [UIColor redColor];
    }
    return _YIButton;

}
-(maskIconButton *)WXButton{

    if (!_WXButton) {
        
        _WXButton = [[maskIconButton alloc] init];
        
        _WXButton.bgcolor = [UIColor greenColor];
    }
    return _WXButton;

}
-(maskIconButton *)SinaButton{

    if (!_SinaButton) {
        
        _SinaButton = [[maskIconButton alloc] init];
        
        _SinaButton.bgcolor = [UIColor brownColor];
    }
    
    return _SinaButton;

}
-(maskIconButton *)QQButton{

    if (!_QQButton) {
        
        _QQButton = [[maskIconButton alloc] init];
        
        _QQButton.bgcolor = [UIColor cyanColor];
        
    }
    
    return _QQButton;

}
-(UIButton *)signButton{

    if (!_signButton) {
        
        _signButton = [[UIButton alloc] init];
        
        _signButton.layer.masksToBounds = YES;
        _signButton.layer.cornerRadius = 10;
        
        _signButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _signButton.backgroundColor = [UIColor orangeColor];
        [_signButton setTitle:@"签到" forState:UIControlStateNormal];
        [_signButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }

    return _signButton;

}
-(UIView *)separateLine{

    if (!_separateLine) {
        
        _separateLine = [[UIView alloc] init];
        _separateLine.backgroundColor = [UIColor colorWithRed:237/255.0 green:242/255.0 blue:246/255.0 alpha:1];
    }
    return _separateLine;
}
-(void)layoutSubviews{

    [super layoutSubviews];

    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.left.mas_equalTo(self.mas_left);
        
        make.size.mas_equalTo(CGSizeMake(BUTTONWIDTH, 55));
        
    }];
    
    [_historyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.centerX.mas_equalTo(self.mas_centerX);
        
        make.size.mas_equalTo(CGSizeMake(BUTTONWIDTH, 55));
    }];

    
    [_tieButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.left.mas_equalTo(self.historyButton.mas_right);
        
        make.size.mas_equalTo(CGSizeMake(BUTTONWIDTH, 55));
        
    }];
    
    [_YIButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(@(15));
        
        make.top.mas_equalTo(@(25));
        
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
        
    }];
    
    [_WXButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_YIButton.mas_right).offset(17);
        
        make.top.mas_equalTo(@(25));
        
        make.size.mas_equalTo(self.YIButton);
        
    }];
    
    [_SinaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_WXButton.mas_right).offset(17);
        
        make.top.mas_equalTo(@(25));
        
        make.size.mas_equalTo(self.YIButton);

    }];
    
    [_QQButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_SinaButton.mas_right).offset(17);
        
        make.top.mas_equalTo(@(25));
        
        make.size.mas_equalTo(self.YIButton);

    }];
    
    [_signButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_QQButton.mas_right).offset(17);
        
        make.right.mas_equalTo(self.mas_right).offset(-15);
        
        make.centerY.mas_equalTo(self.QQButton.mas_centerY);
        
        make.height.mas_equalTo(@(20));
    }];
    
    [_separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_QQButton.mas_bottom).offset(20);
        
        make.height.mas_equalTo(@(1));
        
        make.left.mas_equalTo(@(15));
        
        make.right.mas_equalTo(self.mas_right).offset(-15);
        
        
    }];
    
    //布局登录状态后，登录住视图的改变
    [_loginPersonImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(@(20));
        make.left.mas_equalTo(@(20));
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    
    [_loginPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(@(25));
        make.left.mas_equalTo(self.loginPersonImage.mas_right).offset(10);
        make.height.mas_equalTo(@(18));
        
    }];
    
    [_loginPersonRank mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.loginPersonLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.loginPersonImage.mas_right).offset(10);
        make.height.mas_equalTo(@(12));
    }];
}

-(void)ImageWithRect:(CGRect )rect Radius:(CGFloat)radius{

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
