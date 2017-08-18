//
//  MineViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/17.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableView.h"
#import "MineTableHeaderView.h"
#import "PersonPannelView.h"
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface MineViewController ()

@property (nonatomic , strong)MineTableView * myTable;
@property (nonatomic , strong)MineTableHeaderView * myTableHeader;
@property (nonatomic , strong)PersonPannelView * PPView;
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
