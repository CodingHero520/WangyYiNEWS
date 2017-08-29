//
//  MineTableHeaderView.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JumpToOtherPagesBlock)(NSInteger buttonIndex);
@interface MineTableHeaderView : UIView
@property (nonatomic,strong)UIButton * loginButton;
@property (nonatomic,strong)UIButton * registerButton;
@property (nonatomic,copy)JumpToOtherPagesBlock JumpBlock;
@end
