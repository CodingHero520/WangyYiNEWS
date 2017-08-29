//
//  RegisterNextViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/22.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "RegisterNextViewController.h"
#import "AFNetRequestManager.h"
static NSInteger DJSTimer = 30;
@interface RegisterNextViewController ()

{

    NSTimer * timer;
}

@end

@implementation RegisterNextViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self simpleConfigButton];
    
    [self DealWithIphoneNumber:self.UserIphoneNumber];
}
-(void)simpleConfigButton{

    self.SendMessCodeTimer.layer.masksToBounds = YES;
    self.SendMessCodeTimer.layer.cornerRadius = 5;
    
    self.SendMessCodeTimer.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.SendMessCodeTimer.layer.borderWidth = 1;
    self.SendMessCodeTimer.backgroundColor = [UIColor whiteColor];

    
    self.RegisterButton.layer.masksToBounds = YES;
    self.RegisterButton.layer.cornerRadius = 5;
    
    self.MessageDescribe.backgroundColor = [UIColor whiteColor];
    
    [self.RegisterButton addTarget:self action:@selector(TapRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)GetSmsCodeload{
    
    NSString * urlstr = [NSString stringWithFormat:@"http://localhost:63342/MySql/php/api_demo/SmsDemo.php?telphone=%@",self.UserIphoneNumber];
    [AFNetRequestManager PostRequestWithURLString:urlstr WithParameter:nil WithSuccessBlock:^(id object) {
        
        NSLog(@"短信验证码反馈的数据是:%@",object);
        
        
    } WithFailureBlock:^(NSError *error) {
        
        
        
        
    }];

}
-(void)TapRegisterButton:(UIButton *)button{
    
    if (self.InputMessVercityCodeButton.text.length == 0) {
        
        UIAlertController * alertcontrooler = [UIAlertController alertControllerWithTitle:nil message:@"请输入正确的短信验证码!" preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction * alertaction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            
        }];
        
        [alertcontrooler addAction:alertaction1];
        
        [self presentViewController:alertcontrooler animated:YES completion:nil];
        
        
        return;
        
    }
    
    if (self.SetPassWordField.text.length == 0) {
        
        UIAlertController * alertcontrooler = [UIAlertController alertControllerWithTitle:nil message:@"请设置正确格式的密码!" preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction * alertaction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            
        }];
        
        [alertcontrooler addAction:alertaction1];
        
        [self presentViewController:alertcontrooler animated:YES completion:nil];
        
        
        return;
        
    }
    

    [self Sendload];


}
-(void)Sendload{
    
    NSString * urlstr = [NSString stringWithFormat:@"http://localhost:63342/MySql/app.php?iphonenum=%@&zooname=@163.com&vertifyCode=%d&passwordlogin=%@",self.UserIphoneNumber,[self.InputMessVercityCodeButton.text intValue],self.SetPassWordField.text];

   [AFNetRequestManager PostRequestWithURLString:urlstr WithParameter:nil WithSuccessBlock:^(id object) {
      
       NSLog(@"回调信息:%@",object);
       
       NSDictionary * registerinfo = (NSDictionary *)object;
       
       NSDictionary * data = registerinfo[@"data"];
       
       if ([data[@"type"] integerValue]== 1) {
           
           UIAlertController * alertcontrooler = [UIAlertController alertControllerWithTitle:nil message:@"恭喜你注册网易成功！" preferredStyle: UIAlertControllerStyleAlert];
           
           UIAlertAction * alertaction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               
               [self.navigationController popToRootViewControllerAnimated:YES];
           }];
           
           [alertcontrooler addAction:alertaction1];
           
           [self presentViewController:alertcontrooler animated:YES completion:nil];
           
           
       }
       
   } WithFailureBlock:^(NSError *error) {
       
       
       
   }];
    

}
-(void)DealWithIphoneNumber:(NSString *)IphoneNumber{
    
    NSString * destext = @"短信验证码已经发送:";
    
    NSRange rang1 = NSMakeRange(4, 4);
    
    NSMutableString * mutastr = [[NSMutableString alloc] initWithString:IphoneNumber];
    
    [mutastr replaceCharactersInRange:rang1 withString:@"****"];
    
    self.MessageDescribe.text = [destext stringByAppendingString:mutastr];
    
}
-(void)SetDJSTimer{
    
    timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

}
-(void)runTimer{
    
    DJSTimer -- ;
    
    [self.SendMessCodeTimer setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.SendMessCodeTimer setTitle:[NSString stringWithFormat:@"重新发送:(%ld)",(long)DJSTimer] forState:UIControlStateNormal];

    if(DJSTimer == 0) {
        [self.SendMessCodeTimer setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        //定时器暂时停止
        timer.fireDate = [NSDate distantFuture];
    }
   
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
    //只要进入到这个界面，就触发定时器倒计时方法
    [self SetDJSTimer];
    
    //一进入这个界面就发送短信验证码
    [self GetSmsCodeload];
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
