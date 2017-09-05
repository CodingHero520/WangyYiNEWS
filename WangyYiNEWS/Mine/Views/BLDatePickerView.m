//
//  BLDatePickerView.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/31.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "BLDatePickerView.h"
#import "Masonry.h"
@interface BLDatePickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong)UILabel * titlename;   //标题
@property (nonatomic ,strong)UIDatePicker * datePicker; //日期选择器
@property (nonatomic ,strong)UIView * separtorLineOfH;  //横线
@property (nonatomic ,strong)UIView * separtorLineOfW;  //竖线
@property (nonatomic ,strong)UIView * MaskGroundView;   //遮罩视图1
@property (nonatomic ,strong)UIView * PickerSuperview;  //日期选择器父视图
@property (nonatomic ,strong)UIButton * CButton;        //取消按钮
@property (nonatomic ,strong)UIButton * SButton;        //确定按钮
@property (nonatomic ,strong)UIPickerView * SexyPicker; //性别选择器
@property (nonatomic ,strong)NSMutableArray * pickerDataSource;
@property (nonatomic ,assign)BOOL isRecordBirthPicker;
@end
@implementation BLDatePickerView
static BLDatePickerView * datepicker = nil;
+(BLDatePickerView *)share{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        datepicker = [[self alloc] init];
    });

    return datepicker;
}
//+(instancetype)allocWithZone:(struct _NSZone *)zone{
//
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        datepicker = [self allocWithZone:zone];
//    });
//
//    return datepicker;
//
//}
//-(id)copyWithZone:(NSZone *)zone{
//    
//    return datepicker;
//    
//}
//创建遮罩视图
-(NSMutableArray *)pickerDataSource{

    if (!_pickerDataSource) {
        
        NSArray * array = @[@"男",@"女"];
        _pickerDataSource = (NSMutableArray *)array;
    }
    return _pickerDataSource;

}
-(UIView *)MaskGroundView{

    if (!_MaskGroundView) {
        
        _MaskGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, kHEIGHT)];
        
        _MaskGroundView.backgroundColor = UIColorFromHEX(0x000000, 0.7);
        
        _MaskGroundView.alpha = 0;
        
        [UIView animateWithDuration:0.3 animations:^{
        
            _MaskGroundView .alpha = 1;
        }];
        
        [[UIApplication sharedApplication].delegate.window addSubview:_MaskGroundView];
        
    }

    return _MaskGroundView;

}
-(UIView *)PickerSuperview{

    if (!_PickerSuperview) {
        
        _PickerSuperview = [[UIView alloc] init];
        _PickerSuperview.backgroundColor = [UIColor whiteColor];
        _PickerSuperview.layer.masksToBounds = YES;
        _PickerSuperview.layer.cornerRadius = 5;
    }

    return _PickerSuperview;


}
-(UIDatePicker *)datePicker{

    if (!_datePicker) {
        
        _datePicker = [[UIDatePicker alloc] init];
        
        _datePicker.backgroundColor = [UIColor whiteColor];
        
        _datePicker.datePickerMode = UIDatePickerModeDate;
        
        NSDate * minDate = [[NSDate alloc] initWithTimeIntervalSince1970:0];
        
        NSDate * maxDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        
        _datePicker.minimumDate = minDate;
        
        _datePicker.maximumDate = maxDate;
        
        _datePicker.date = minDate;
        
        
        
        [_datePicker setDate:minDate animated:YES];
        
    }
    
    return _datePicker;
}
-(UILabel *)titlename{

    if (!_titlename) {
        
        _titlename = [[UILabel alloc] init];
        _titlename.font = [UIFont systemFontOfSize:15 weight:1];
        [self.PickerSuperview addSubview:_titlename];
        
        [_titlename mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(self.PickerSuperview.mas_centerX);
            
            make.top.mas_equalTo(@(20));
            
            make.height.mas_equalTo(@(16));
            
        }];
    }
    
    return _titlename;

}
//水平分割线
-(UIView *)separtorLineOfH{

    if (!_separtorLineOfH) {
        
        _separtorLineOfH = [[UIView alloc]init];
        [self.PickerSuperview addSubview:_separtorLineOfH];
        _separtorLineOfH.backgroundColor = [UIColor grayColor];
        [_separtorLineOfH mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(@(1));
            make.right.mas_equalTo(self.PickerSuperview.mas_right);
            make.left.mas_equalTo(self.PickerSuperview.mas_left);
            make.bottom.mas_equalTo(self.PickerSuperview.mas_bottom).offset(-38);
            
        }];
        
        
    }

    return _separtorLineOfH;

}
-(UIView *)separtorLineOfW{

    if (!_separtorLineOfW) {
        
        _separtorLineOfW = [[UIView alloc] init];
        _separtorLineOfW.backgroundColor = [UIColor grayColor];
        [self.PickerSuperview addSubview:_separtorLineOfW];
        
        [_separtorLineOfW mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(self.PickerSuperview.mas_centerX);
            make.width.mas_equalTo(@(1));
            make.top.mas_equalTo(self.separtorLineOfH.mas_bottom);
            make.bottom.mas_equalTo(self.PickerSuperview.mas_bottom);
            
        }];
    }

    return _separtorLineOfW;

}
-(UIButton *)CButton{

    if (!_CButton) {
        
        _CButton = [[UIButton alloc] init];
        [_CButton setTitleColor:RGBCOLOR(0, 106, 255, 1) forState:UIControlStateNormal];
        _CButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:1];
        [self.PickerSuperview addSubview:_CButton];
        
        [_CButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(KWIDTH/2-45, 38));
            make.left.mas_equalTo(self.PickerSuperview.mas_left);
            make.bottom.mas_equalTo(self.PickerSuperview.mas_bottom);
            
        }];
        [_CButton addTarget:self action:@selector(tipCancelButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _CButton;

}
-(UIButton *)SButton{

    if (!_SButton) {
        
        _SButton = [[UIButton alloc] init];
        [_SButton setTitleColor:RGBCOLOR(0, 106, 255, 1) forState:UIControlStateNormal];
        _SButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:1];
        [self.PickerSuperview addSubview:_SButton];
        [_SButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(KWIDTH/2-45, 38));
            make.right.mas_equalTo(self.PickerSuperview.mas_right);
            make.bottom.mas_equalTo(self.PickerSuperview.mas_bottom);
        }];
        [_SButton addTarget:self action:@selector(tipSureButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _SButton;
}
-(UIPickerView *)SexyPicker{

    if (!_SexyPicker) {
        
        _SexyPicker = [[UIPickerView alloc] init];
        _SexyPicker.delegate = self;
        _SexyPicker.dataSource = self;
        
    }
    
    return _SexyPicker;

}
-(void)BLDataPickerViewWithTitle:(NSString *)title WithSureBlock:(SureButton)sureblock WithCancelBlock:(CancelButton)cancelblock{
    
    _isRecordBirthPicker = NO;
    
    NSLog(@"%@",title);
    
    self.SureBlock = sureblock;
    
    self.CancelBlock = cancelblock;
    
    [self.MaskGroundView addSubview:self.PickerSuperview];
    
    //布局选择器父视图
    [self.PickerSuperview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(KWIDTH-90, 275));
        
        make.centerX.mas_equalTo(self.MaskGroundView.mas_centerX);
        
        make.centerY.mas_equalTo(self.MaskGroundView.mas_centerY);
        
    }];
    


    if ([title isEqualToString:@"修改生日"]) {
        _isRecordBirthPicker = YES;
        
        [self.PickerSuperview addSubview:self.datePicker];
    
        //布局日期选择器
        [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(KWIDTH-90, 150));
            
            make.centerX.mas_equalTo(self.PickerSuperview.mas_centerX);
            
            make.centerY.mas_equalTo(self.PickerSuperview.mas_centerY);
            
        }];
    }else{
        _isRecordBirthPicker = NO;
    
        [self.PickerSuperview addSubview:self.SexyPicker];
        
        [self.SexyPicker mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(KWIDTH-90, 150));
            
            make.centerX.mas_equalTo(self.PickerSuperview.mas_centerX);
            
            make.centerY.mas_equalTo(self.PickerSuperview.mas_centerY);
            
        }];

        
    }
    
    
    
    
   
    self.titlename.text = title;
    
    
    self.separtorLineOfH.alpha = 0.2;
    self.separtorLineOfW.alpha = 0.2;
    [self.CButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.SButton setTitle:@"确定" forState:UIControlStateNormal];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.pickerDataSource.count;

}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return self.pickerDataSource[row];

}
-(void)tipCancelButton:(UIButton *)button{


    [self removeDatePicker];
    
}
-(void)tipSureButton:(UIButton *)button{
 
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSString * currentDataStr = [dateFormat stringFromDate:self.datePicker.date];
    
    NSInteger row=[self.SexyPicker selectedRowInComponent:0];
    NSString *dateStr=[self.pickerDataSource objectAtIndex:row];
    
    if (_isRecordBirthPicker == YES) {
     
        self.SureBlock(currentDataStr);
    
    }else{
    
       self.SureBlock(dateStr);
    }
    
    [self removeDatePicker];
}
-(void)removeDatePicker{

    [UIView animateWithDuration:0.3 animations:^{
        self.MaskGroundView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self.MaskGroundView removeFromSuperview];
        self.MaskGroundView = nil;
        self.PickerSuperview = nil;
        self.titlename = nil;
        self.datePicker = nil;
        self.separtorLineOfH = nil;
        self.separtorLineOfW = nil;
        self.SButton = nil;
        self.CButton = nil;
        
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
