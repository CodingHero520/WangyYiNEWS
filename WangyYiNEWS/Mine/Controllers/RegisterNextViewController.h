//
//  RegisterNextViewController.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/22.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterNextViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *MessageDescribe;

@property (weak, nonatomic) IBOutlet UITextField *InputMessVercityCodeButton;

@property (weak, nonatomic) IBOutlet UIButton *SendMessCodeTimer;

@property (weak, nonatomic) IBOutlet UITextField *SetPassWordField;

@property (weak, nonatomic) IBOutlet UIButton *RegisterButton;
@property (weak, nonatomic) IBOutlet UILabel *RegisterProcotol;

@property (nonatomic , copy)NSString * UserIphoneNumber;
@end
