//
//  GlobalNavigationController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/17.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "GlobalNavigationController.h"

@interface GlobalNavigationController ()

@end

@implementation GlobalNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
}

-(void)goback{
    
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    [super pushViewController:viewController animated:animated];
    
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
