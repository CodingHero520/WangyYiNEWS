//
//  MineViewController.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/17.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineTableHeaderView.h"
#import "PersonPannelView.h"
@interface MineViewController : UIViewController
@property (nonatomic , strong)MineTableHeaderView * myTableHeader;
@property (nonatomic , strong)PersonPannelView * PPView;
@property (nonatomic , assign)BOOL ISLogin;
@end
