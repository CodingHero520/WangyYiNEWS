//
//  PersonPannelView.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "maskIconButton.h"
@interface PersonPannelView : UIView
@property (nonatomic , strong)maskIconButton * YIButton;
@property (nonatomic , strong)maskIconButton * WXButton;
@property (nonatomic , strong)maskIconButton * SinaButton;
@property (nonatomic , strong)maskIconButton * QQButton;

@property (nonatomic , strong)UIButton * loginPersonImage;
@property (nonatomic , strong)UILabel * loginPersonLabel;
@property (nonatomic , strong)UILabel * loginPersonRank;
@end
