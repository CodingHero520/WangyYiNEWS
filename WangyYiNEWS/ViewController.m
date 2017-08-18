//
//  ViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/17.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setNavigatioinItem];
    
}
-(void)setNavigatioinItem{

    UILabel * titlelabel = [[UILabel alloc] init];
    titlelabel.frame = CGRectMake(0, 100, 60, 20);
    titlelabel.text = @"网易";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    titlelabel.enabled = YES;
    titlelabel.font = [UIFont fontWithName:@"Zapfino" size:18.0];
    self.navigationItem.titleView = titlelabel;
    
    NSDictionary * dint = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Zapfino" size:18],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = dint;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
