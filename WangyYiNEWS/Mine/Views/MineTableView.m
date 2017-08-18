//
//  MineTableView.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "MineTableView.h"

static  NSString * MineCellId = @"MineCellId";

@interface MineTableView ()<UITableViewDelegate , UITableViewDataSource>



@end
@implementation MineTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{


    self = [super initWithFrame:frame style:style];

    if (self) {
        
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        self.dataSource = self;
        self.delegate   = self;
    }

    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        
        return 2;
    }else if (section == 1){
    
        return 3;
    }else{
    
        return 1;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MineCellId];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MineCellId];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.infoArray[indexPath.section][indexPath.row];
    
    if (indexPath.section ==1 && indexPath.row == 1) {
        
        cell.detailTextLabel.text = @"为震区祈福，共筑平安墙";
    }
    
    cell.imageView.image = [UIImage imageNamed:@"1.png"];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 50;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
