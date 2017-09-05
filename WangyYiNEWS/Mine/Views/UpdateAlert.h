//
//  UpdateAlert.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/30.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DefaultButton)(NSString * lastestName); //点击确定按钮执行的block快
typedef void(^CancelButton)();  //点击取消按钮执行的block块
@interface UpdateAlert : UIView

@property (nonatomic,copy)DefaultButton defaultblock;
@property (nonatomic,copy)CancelButton cancelblock;

+(UpdateAlert *)Share;

+(void)show;

+(void)dismiss;

-(void)UpdateNameAlertWithTitle:(NSString *)title WithDefaultButtonBlock:(DefaultButton)defautblock WithCancelButtonBlcok:(CancelButton)cancelblock;


@end
