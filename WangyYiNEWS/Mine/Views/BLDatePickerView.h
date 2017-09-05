//
//  BLDatePickerView.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/31.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SureButton)(NSString * currentDate);
typedef void(^CancelButton)();
@interface BLDatePickerView : UIView

@property (nonatomic ,copy)SureButton  SureBlock;
@property (nonatomic ,copy)CancelButton  CancelBlock;

//获取单利对像
+(BLDatePickerView *)share;

-(void)BLDataPickerViewWithTitle:(NSString *)title WithSureBlock:(SureButton )sureblock WithCancelBlock:(CancelButton )cancelblock;

@end
