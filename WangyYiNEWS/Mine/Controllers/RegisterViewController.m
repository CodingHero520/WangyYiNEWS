//
//  RegisterViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "RegisterViewController.h"
#import "AFNetRequestManager.h"
#import "RegisterNextViewController.h"
#import "GlobalWKWebView.h"
@import WebKit;
@interface RegisterViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong)GlobalWKWebView * VertifyImageView;
@property (nonatomic,strong)NSMutableDictionary * GlobalDictionary;
@property (nonatomic,strong)NSString * verfityParam;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self ConfigureSubviews];
    [self ConfigDescrib];
    [self.VerifyButton addTarget:self action:@selector(tapVercityImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.NextStepButton addTarget:self action:@selector(tapNextStep:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}
-(GlobalWKWebView *)VertifyImageView{

    if (!_VertifyImageView) {
       
        CGRect wkrect = CGRectMake(25, 70, KWIDTH-50, 85);
        
        _VertifyImageView = [[GlobalWKWebView alloc] initWithFrame:wkrect];
        
        NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost:63342/MySql/CertifyImage.html"]];
        
        [_VertifyImageView loadRequest:request];
        
        [self.view addSubview:_VertifyImageView];
        
        
    }
    
    __weak typeof(self)weakSelf = self;
    
    _VertifyImageView.VerfityButtonBlock = ^(NSString * verfityStr,NSInteger statusCode){
    
        [weakSelf.VerifyButton setTitle:verfityStr forState:UIControlStateNormal];
        
        UIColor * textcolor = statusCode == 1? [UIColor greenColor]:[UIColor redColor];
        
        [weakSelf.VerifyButton setTitleColor:textcolor forState:UIControlStateNormal];
        
        if (statusCode == 1) {
            
            weakSelf.InputIphoneNumer.hidden = NO;
            weakSelf.ZoneName.hidden = NO;
            
            weakSelf.VertifyImageView.hidden = YES;
            
        }
    
    };

    return _VertifyImageView;

}
-(NSMutableDictionary *)GlobalDictionary{

    if (!_GlobalDictionary) {
        
        NSDictionary * dictionary = @{};
        
        _GlobalDictionary = dictionary.mutableCopy;
        
    }

    return _GlobalDictionary;


}
-(void)tapVercityImage:(UIButton *)button{

    //点击验证按钮，按钮失去交互能力
    button.userInteractionEnabled = NO;
    //隐藏手机号输入框，域名
    self.InputIphoneNumer.hidden = YES;
    self.ZoneName.hidden = YES;
    
    self.VertifyImageView.hidden = NO;
    
    self.verfityParam = @"A";

    //点击web上面的验证码－>进行后台验证->验证成功->通过交互方法，向app穿一个数据字典（1:验证成功，2:验证失败）－>刷新按钮
    
}
-(void)tapNextStep:(UIButton *)button{
    
    //判断手机号是否为空
    
    if (self.InputIphoneNumer.text.length == 0) {
        
        UIAlertController * alertcontrooler = [UIAlertController alertControllerWithTitle:nil message:@"手机号不能为空!" preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction * alertaction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            
        }];
        
        [alertcontrooler addAction:alertaction1];
        
        [self presentViewController:alertcontrooler animated:YES completion:nil];
        
        return ;
    }
    
    if (![self.VerifyButton.titleLabel.text isEqualToString:@"验证成功"]) {
        
        
        UIAlertController * alertcontrooler = [UIAlertController alertControllerWithTitle:nil message:@"请验证点击式验证码!" preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction * alertaction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            
        }];
        
        [alertcontrooler addAction:alertaction1];
        
        [self presentViewController:alertcontrooler animated:YES completion:nil];
        

        return;
    }

    //跳转到下一页
    
    RegisterNextViewController * RNVC = [[RegisterNextViewController alloc] initWithNibName:@"RegisterNextViewController" bundle:[NSBundle mainBundle]];
    RNVC.UserIphoneNumber = self.InputIphoneNumer.text;
    [self.navigationController pushViewController:RNVC animated:YES];

    
}
-(void)ConfigureSubviews{

    self.InputIphoneNumer.layer.masksToBounds = YES;
    self.InputIphoneNumer.layer.cornerRadius  = 5;
    
    self.ZoneName.layer.borderWidth = 1;
    self.ZoneName.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.ZoneName.layer.masksToBounds = YES;
    self.ZoneName.layer.cornerRadius = 5;
    
    
    self.VerifyButton.layer.masksToBounds = YES;
    self.VerifyButton.layer.cornerRadius = 20;
    self.VerifyButton.layer.borderWidth = 1;
    self.VerifyButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.NextStepButton.layer.masksToBounds = YES;
    self.NextStepButton.layer.cornerRadius = 5;
    

}

-(void)ConfigDescrib{

   NSString * TextStr = @"用户注册即代表同意《服务条款》和《网络游戏用户隐私保护和个人信息利用政策》";
    
   NSMutableAttributedString * mutstr = [[NSMutableAttributedString alloc] initWithString:TextStr];
    
    NSRange range1 = NSMakeRange(9, 6);
    
    NSRange range2 = [TextStr rangeOfString:[TextStr substringFromIndex:16]];
    
    [mutstr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(0, 156, 254, 1) range:range1];

    [mutstr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(0, 156, 254, 1) range:range2];

    
    self.DesLabel.font = [UIFont systemFontOfSize:12];
    
    self.DesLabel.textColor = [UIColor lightGrayColor];
    
    self.DesLabel.numberOfLines = 0;
    
    [self.DesLabel setAttributedText:mutstr];

}
-(void)laodinfo{
    
    [self.GlobalDictionary removeAllObjects];
    
    NSString * urlstr = [NSString stringWithFormat:@"http://localhost:63342/MySql/app.php?iphonenum=%@&zooname=@163.com&vertifyCode=yuan",self.InputIphoneNumer.text];
    
    [AFNetRequestManager PostRequestWithURLString:urlstr WithParameter:nil WithSuccessBlock:^(id object) {
       
    
        NSDictionary * dict = (NSDictionary *)object[@"data"];
        self.GlobalDictionary = dict.mutableCopy;
        
        NSLog(@"请求的数据:%@",self.GlobalDictionary);
        
        if ([self.GlobalDictionary[@"type"] integerValue] == 1) {
            
            
        }

        
       
   } WithFailureBlock:^(NSError *error) {
       
       
   }];
}
-(void)initLoad{

    [AFNetRequestManager PostRequestWithURLString:@"http://localhost:63342/MySql/register.php" WithParameter:nil WithSuccessBlock:^(id object) {
        
        NSLog(@"注册界面初始化信息:%@",object);
        
        NSDictionary * dict = (NSDictionary *)object;
        
        if ([dict[@"responseCode"] integerValue] == 1) {
            
            [self.VerifyButton setTitle:dict[@"verfityChar"] forState:UIControlStateNormal];
            [self.VerifyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
        
        
    } WithFailureBlock:^(NSError *error) {
       
        
        
    }];

}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
    //每次进入到这个界面的啥时候，恢复按钮的交互能力
    self.VerifyButton.userInteractionEnabled = YES;
    
    [self initLoad];
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
