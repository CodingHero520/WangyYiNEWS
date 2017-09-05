//
//  LoginViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetRequestManager.h"
#import "MineViewController.h"


@interface LoginViewController ()

{

    NSDictionary * AFNDictionary;

}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self ConfigureVC];
}

-(void)ConfigureVC{
    
    
    [self.loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)loginAction:(UIButton *)button{
    
 
    //保存手机号
    [[NSUserDefaults standardUserDefaults]setValue:self.InputTelphone.text forKey:@"username"];
    //保存密码
    [[NSUserDefaults standardUserDefaults]setValue:self.InputLoginPassword.text forKey:@"password"];
    
    
    
    NSLog(@"电话号码:%@",self.InputTelphone.text);

    NSString * urlstr = [NSString stringWithFormat:@"http://localhost:63342/MySql/login.php?telphone0=%@&logpassword=%@",self.InputTelphone.text,self.InputLoginPassword.text];
    
    [AFNetRequestManager PostRequestWithURLString:urlstr WithParameter:nil WithSuccessBlock:^(id object) {
        NSLog(@"obj:%@",object);
        
        
        
        NSDictionary * returndict = (NSDictionary *)object;
        
        if ([returndict[@"code"] integerValue] == 200) {
            
            UIAlertController * alertcontroller = [UIAlertController alertControllerWithTitle:nil message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction * act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                AFNDictionary = (NSDictionary *)object;
                
                [self SearchViewController];
                

            }];
            
            [alertcontroller addAction:act];
            
            
            [self presentViewController:alertcontroller animated:YES completion:nil];
            
            
        }
        
    } WithFailureBlock:^(NSError *error) {
        
        
    }];


}
//推出的视图控制器不存在 去栈内找
-(void)SearchViewController{

    for (UIViewController * controller in self.navigationController.viewControllers) {
        
        
        NSLog(@"子控制器:%@",controller);
        
        if ([controller isKindOfClass:[MineViewController class]]) {
            
            MineViewController * mine = (MineViewController *)controller;
            
            mine.ISLogin = YES;
            mine.PPView.loginPersonLabel.text = AFNDictionary[@"newname"];
            mine.PPView.loginPersonRank.text = AFNDictionary[@"userrank"];
        
            //保存网名
            [[NSUserDefaults standardUserDefaults]setValue:AFNDictionary[@"newname"] forKey:@"newname"];
            
            [self.navigationController popToViewController:mine animated:YES];
            
        }else{
        
//            [self.navigationController popToRootViewControllerAnimated:YES];
        
        }
        
    }

}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];

   
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
