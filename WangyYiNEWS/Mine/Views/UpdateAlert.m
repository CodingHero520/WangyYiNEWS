//
//  UpdateAlert.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/30.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "UpdateAlert.h"
#import "Masonry.h"

@interface UpdateAlert ()<UITextFieldDelegate>

@property (nonatomic , strong)UIView * InputAlertBackGround;
@property (nonatomic , strong)UIView * AlertView;
@property (nonatomic , strong)UILabel * titleName;
@property (nonatomic , strong)UITextField * InputMesgField;
@property (nonatomic , strong)UIButton * CancelButton;
@property (nonatomic , strong)UIButton * SureButton;
@property (nonatomic , strong)UIView * separtorLineOfH;
@property (nonatomic , strong)UIView * separtorLineOfW;
@end

@implementation UpdateAlert
static UpdateAlert * update = nil;
+(UpdateAlert *)Share{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        update = [[self alloc]init];
    });
    
    return update;

}
//alert背景图
-(UIView *)InputAlertBackGround{

    if (!_InputAlertBackGround) {
     
        _InputAlertBackGround = [[UIView alloc] init];
        _InputAlertBackGround.frame = CGRectMake(0, 0, KWIDTH, kHEIGHT);
        _InputAlertBackGround.backgroundColor = UIColorFromHEX(0x000000, 0.7);
        [[UIApplication sharedApplication].delegate.window addSubview:_InputAlertBackGround];
        
        _InputAlertBackGround.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            _InputAlertBackGround.alpha = 1;
        }];
        
    }
    return _InputAlertBackGround;

}
//alert
-(UIView *)AlertView{

    if (!_AlertView) {
        
        _AlertView = [[UIView alloc] init];
        _AlertView.bounds = CGRectMake(0, 0, KWIDTH-90, 125);
        _AlertView.center = CGPointMake(KWIDTH/2, kHEIGHT/2);
        _AlertView.backgroundColor = [UIColor whiteColor];
        _AlertView.layer.masksToBounds = YES;
        _AlertView.layer.cornerRadius = 5;
        _AlertView.clipsToBounds = YES;
        
    }

    return _AlertView;

}
-(UILabel *)titleName{

    if (!_titleName) {
    
        _titleName = [[UILabel alloc] init];
        _titleName.font = [UIFont systemFontOfSize:15 weight:1];
        [self.AlertView addSubview:_titleName];
        [_titleName mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.mas_equalTo(self.AlertView.mas_centerX);
            make.top.mas_equalTo(@(18));
            make.height.mas_equalTo(@(16));
            
        }];
    }
    return _titleName;
}
-(UITextField *)InputMesgField{

    if (!_InputMesgField) {
        _InputMesgField = [[UITextField alloc] init];
        _InputMesgField.delegate = self;
        _InputMesgField.keyboardType = UIKeyboardTypeDefault;
        _InputMesgField.returnKeyType = UIReturnKeyDone;
        _InputMesgField.font = [UIFont systemFontOfSize:16];
        _InputMesgField.textColor = UIColorFromHEX(0x333333, 1);
        _InputMesgField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _InputMesgField.layer.borderWidth = 0.5;
        _InputMesgField.layer.borderColor = [UIColor blackColor].CGColor;
        
    
        [self.AlertView addSubview:_InputMesgField];
        [_InputMesgField mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(@(15));
            make.width.mas_equalTo(KWIDTH-120);
            make.top.mas_equalTo(self.titleName.mas_bottom).offset(17);
            make.height.mas_equalTo(@(24));
            
        }];
        
        
    }
    return _InputMesgField;

}
-(UIButton *)CancelButton{

    if (!_CancelButton) {
        
        _CancelButton = [[UIButton alloc] init];
        
        
        [self.AlertView addSubview:_CancelButton];
        
        [_CancelButton setTitleColor:RGBCOLOR(0, 115, 255, 1) forState:UIControlStateNormal];
        
        [_CancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(KWIDTH/2-45);
            
            make.top.mas_equalTo(self.InputMesgField.mas_bottom).offset(10);
            
            make.left.mas_equalTo(0);
            
            make.bottom.mas_equalTo(self.AlertView.mas_bottom);
            
        }];
    }

    return _CancelButton;

}
-(UIButton *)SureButton{

    if (!_SureButton) {
        
        _SureButton = [[UIButton alloc] init];
        
        [self.AlertView addSubview:_SureButton];
        
        [_SureButton setTitleColor:RGBCOLOR(0, 115, 255, 1) forState:UIControlStateNormal];
        
        [_SureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(KWIDTH/2-45);
            
            make.top.mas_equalTo(self.InputMesgField.mas_bottom).offset(10);
            
            make.left.mas_equalTo(KWIDTH/2-45);
            
            make.bottom.mas_equalTo(self.AlertView.mas_bottom);
            
        }];
    }
    
    return _SureButton;

}
-(UIView *)separtorLineOfH{

    if (!_separtorLineOfH) {
        
        _separtorLineOfH = [[UIView alloc]init];
        [self.AlertView addSubview:_separtorLineOfH];
        
        [_separtorLineOfH mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.mas_equalTo(self.SureButton.mas_top);
            
            make.width.mas_equalTo(self.AlertView.mas_width);
            
            make.height.mas_equalTo(1);
            
            make.left.mas_equalTo(0);
            
        }];
        
    }
    return _separtorLineOfH;
}
-(UIView *)separtorLineOfW{

    if (!_separtorLineOfW) {
        
        _separtorLineOfW = [[UIView alloc] init];
        [self.AlertView addSubview:_separtorLineOfW];
        
        [_separtorLineOfW mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(self.AlertView.mas_centerX);
            
            make.width.mas_equalTo(1);
            
            make.top.mas_equalTo(self.SureButton.mas_top);
            
            make.height.mas_equalTo(self.SureButton.mas_height);
            
        }];
    }
    
    return _separtorLineOfW;

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.InputMesgField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.InputMesgField resignFirstResponder];
    
    return YES;
}
- (void)shakeToShow:(UIView *)aView
{
    CAKeyframeAnimation * popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.35;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05f, 1.05f, 1.0f)],
                            //                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, /*@0.75f,*/ @0.8f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                     //                                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [aView.layer addAnimation:popAnimation forKey:nil];
}
-(void)UpdateNameAlertWithTitle:(NSString *)title WithDefaultButtonBlock:(DefaultButton)defautblock WithCancelButtonBlcok:(CancelButton)cancelblock{
    
    self.defaultblock = defautblock;
    self.cancelblock = cancelblock;

    [self.InputAlertBackGround addSubview:self.AlertView];

    [self shakeToShow:self.AlertView];
    
    self.titleName.text = title;
    
    self.InputMesgField.placeholder = @"修改名称";

    self.InputMesgField.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"newname"];
    
    self.separtorLineOfH.backgroundColor = RGBCOLOR(203, 203, 203, 1);
    self.separtorLineOfW.backgroundColor = RGBCOLOR(203, 203, 203, 1);
    [self.CancelButton setTitle:@"取消" forState:UIControlStateNormal];

    [self.SureButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [self.CancelButton addTarget:self action:@selector(TipCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.SureButton addTarget:self action:@selector(TipSureButton:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)TipCancelButton:(UIButton *)button{

    if (self.cancelblock) {
        
        self.cancelblock();
    }
    
    [self removeAlert];

}
-(void)TipSureButton:(UIButton *)button{
    
    
    if (self.defaultblock) {
        
        self.defaultblock(self.InputMesgField.text);
    }
    
    [self removeAlert];
}

-(void)removeAlert{

    if ([self.InputMesgField isFirstResponder]) {
        [self.InputMesgField resignFirstResponder];
    }

    [UIView animateWithDuration:0.3 animations:^{
        
        self.InputAlertBackGround.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self.InputAlertBackGround removeFromSuperview];
        self.InputAlertBackGround = nil;
        self.AlertView = nil;
        self.InputMesgField = nil;
        self.SureButton = nil;
        self.CancelButton = nil;
        self.titleName = nil;
        self.separtorLineOfW = nil;
        self.separtorLineOfH = nil;
        
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
