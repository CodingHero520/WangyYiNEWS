//
//  MineViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/17.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableView.h"
//#import "MineTableHeaderView.h"
//#import "PersonPannelView.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "Common.h"
@interface MineViewController ()

@property (nonatomic , strong)MineTableView * myTable;
@property (nonatomic , strong)NSMutableArray * infoArray;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = RGBCOLOR(237, 242, 246, 1);
    
    [self.view addSubview:self.myTable];
    
    [self PPView];
}
-(NSMutableArray *)infoArray{

    if (!_infoArray) {
        
        NSArray * array = @[@[@"我的信息",@"我的关注"],@[@"金币商城",@"活动广场",@"我的钱包"],@[@"设置"]];
        
        _infoArray = array.mutableCopy;
    }

    return _infoArray;
}
-(MineTableView *)myTable{

    if (!_myTable) {
        
        CGRect myTableFrame = CGRectMake(0, 0, KWIDTH, kHEIGHT);
        _myTable = [[MineTableView alloc] initWithFrame:myTableFrame style:UITableViewStyleGrouped];
        _myTable.infoArray = self.infoArray;
        _myTable.tableHeaderView = self.myTableHeader;
    }

    return _myTable;

}
-(MineTableHeaderView *)myTableHeader{

    if (!_myTableHeader) {
        CGRect myTableHeader = CGRectMake(0, 0, KWIDTH, 210);
        _myTableHeader = [[MineTableHeaderView alloc] initWithFrame:myTableHeader];
        _myTableHeader.backgroundColor = RGBCOLOR(191, 41, 42, 1);
    }

    __weak typeof(self)weakself = self;
    
    _myTableHeader.JumpBlock = ^(NSInteger index){
    
        UIViewController * vc = index == 10001? [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:[NSBundle mainBundle]]:[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        
        vc.title = index == 10001? @"注册网易通行证":@"登陆网易新闻";
        
        vc.hidesBottomBarWhenPushed = YES;
        
        [weakself.navigationController pushViewController:vc animated:YES];
    
    };
    
    
    
    return _myTableHeader;

}
-(PersonPannelView *)PPView{

    if (!_PPView) {
        
        _PPView = [[PersonPannelView alloc] initWithFrame:CGRectMake(10, 60, KWIDTH-20, 145)];
        
        [self.view addSubview:_PPView];
        
        [self.view bringSubviewToFront:_PPView];
        
        
    }

    return _PPView;

}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationController.navigationBar.hidden = YES;

    
    self.myTableHeader.loginButton.hidden = self.ISLogin;
    
    self.myTableHeader.registerButton.hidden = self.ISLogin;
    
    self.PPView.WXButton.hidden = self.ISLogin;
    
    self.PPView.SinaButton.hidden = self.ISLogin;
    
    self.PPView.QQButton.hidden = self.ISLogin;
    
    self.PPView.YIButton.hidden = self.ISLogin;
    
    self.PPView.loginPersonImage.hidden = !self.ISLogin;
    
    self.PPView.loginPersonLabel.hidden = !self.ISLogin;
    
    self.PPView.loginPersonRank.hidden = !self.ISLogin;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
