//
//  PersonSetTableViewController.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/29.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "PersonSetTableViewController.h"
#import "Masonry.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UpdateAlert.h"
#import "BLDatePickerView.h"
#import "AFNetRequestManager.h"
typedef void(^ChangeName)(NSString * lastestname);
typedef void(^GetCurrentDate)(NSString * currentData);
typedef void(^SelectedSexy)(NSString * selectedSexy);
@interface PersonSetTableViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong)NSMutableArray * PersonSetMutArray;
@property (nonatomic,strong)UIImageView * userpersonimage;
@property (nonatomic,strong)UIImagePickerController * pickerController;
@property (nonatomic,copy)ChangeName changenameblock;
@property (nonatomic,copy)GetCurrentDate currentDataBlock;
@property (nonatomic,copy)SelectedSexy selectedSextBlock;
@end

@implementation PersonSetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self configureTableFooterView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}
-(void)configureTableFooterView{

    UIView * tablefooterview = [[UIView alloc] init];
    
    tablefooterview.frame = CGRectMake(0, 0, KWIDTH, 70);
    
    self.tableView.tableFooterView = tablefooterview;
    
    UIButton * loginbutton = [[UIButton alloc] init];
    
    loginbutton.frame = CGRectMake(10, 30, KWIDTH-20, 40);
    
    loginbutton.backgroundColor = RGBCOLOR(143, 17, 0, 1);
    
    loginbutton.layer.masksToBounds = YES;
    
    loginbutton.layer.cornerRadius = 5;
    
    [loginbutton setTitle:@"退出登录" forState:UIControlStateNormal];
    
    [tablefooterview addSubview:loginbutton];

}
-(NSMutableArray *)PersonSetMutArray{

    if (!_PersonSetMutArray) {
        
        NSArray * array = @[@[@"通行证"],@[@"头像",@"昵称",@"生日",@"性别"],@[@"跟贴设备名称",@"匿名跟帖"]];
        _PersonSetMutArray = (NSMutableArray *)array;
    }
    
    return _PersonSetMutArray;

}
-(UIImageView *)userpersonimage{

    if (!_userpersonimage) {
        
        _userpersonimage = [[UIImageView alloc] init];
        
        _userpersonimage.layer.masksToBounds = YES;
        
        _userpersonimage.layer.cornerRadius = 15;
        
        _userpersonimage.backgroundColor = [UIColor greenColor];
        
        
    }

    return _userpersonimage;

}
-(UIImagePickerController *)pickerController{


    if (!_pickerController) {
        
        _pickerController = [[UIImagePickerController alloc] init];
        _pickerController.delegate = self;
        _pickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _pickerController.allowsEditing = YES;
        _pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        _pickerController.mediaTypes = @[@"kUTTypeMoive",@"kUTTypeImage"];
        _pickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
       
        
    }
    return _pickerController;

}
-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.PersonSetMutArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    return [self.PersonSetMutArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usedId"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"usedId"];
        cell.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0);
    }
    
    if ((indexPath.section != 0)&& !(indexPath.section == 2 && indexPath.row == 1)) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        NSString * userPhoneName = [[UIDevice currentDevice] name];
        
        cell.detailTextLabel.text = userPhoneName;
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        cell.detailTextLabel.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"newname"];
        
        self.changenameblock = ^(NSString * lastestname){
        
            cell.detailTextLabel.text = lastestname;
            
            [[NSUserDefaults standardUserDefaults] setValue:lastestname forKey:@"newname"];
        
        };
        
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        
        
//        [[NSUserDefaults standardUserDefaults]setValue:@"点击添加生日" forKey:@"currentDate"];
        
        cell.detailTextLabel.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentDate"];
        
        self.currentDataBlock = ^(NSString * currentDate){
        
            cell.detailTextLabel.text = currentDate;
        
            [[NSUserDefaults standardUserDefaults] setValue:currentDate forKey:@"currentDate"];
        };
        
        
    }
    if (indexPath.section == 1 && indexPath.row ==3) {
        
//        [[NSUserDefaults standardUserDefaults] setValue:@"选择性别" forKey:@"selectedSexy"];
        cell.detailTextLabel.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectedSexy"];
        self.selectedSextBlock = ^(NSString * selectedSexyStr){
            cell.detailTextLabel.text = selectedSexyStr;
            
            [[NSUserDefaults standardUserDefaults] setValue:selectedSexyStr forKey:@"selectedSexy"];
            
        };
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
    
        
        [cell.contentView addSubview:self.userpersonimage];
    
        [self.userpersonimage mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerY.mas_equalTo(cell.mas_centerY);
            
            make.right.mas_equalTo(cell.mas_right).offset(-30);
            
            make.size.mas_equalTo(CGSizeMake(30, 30));
            
        }];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = self.PersonSetMutArray[indexPath.section][indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (section == 2) {
        
        UIView * tablefooterview = [[UIView alloc] init];
        
        tablefooterview.frame = CGRectMake(0, 0, KWIDTH, 70);
        
        tablefooterview.backgroundColor = [UIColor greenColor];
        
        UILabel * textlabel = [[UILabel alloc] init];
        
        textlabel.text = @"其它网友将不会看到你的用户名、头像和个人主页";
        
        textlabel.font = [UIFont systemFontOfSize:10];
        
        textlabel.textColor = [UIColor lightGrayColor];
        
        textlabel.frame = CGRectMake(10, 5, KWIDTH-20, 12);
        
        [tablefooterview addSubview:textlabel];
        
        return tablefooterview;
    }
    
    return nil;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES; //可编辑
    //选择图像
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        UIAlertController * alertcontroller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction * alertPhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        //调用照相机
           
            //判断是否可以打开照相机
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                //摄像头
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:picker animated:YES completion:nil];
            }else{
                
                NSLog(@"没有摄像头");
                
            }
            
        }];
        UIAlertAction * alertSelect = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:picker animated:YES completion:nil];
            
            
        }];
        
        UIAlertAction * alertCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertcontroller addAction:alertPhoto];
        [alertcontroller addAction:alertSelect];
        [alertcontroller addAction:alertCancel];
        
        [self presentViewController:alertcontroller animated:YES completion:nil];
        
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        //书写名称
        [[UpdateAlert Share] UpdateNameAlertWithTitle:@"修改昵称" WithDefaultButtonBlock:^(NSString *lastestName) {
            
            NSLog(@"更改之后的名字:%@",lastestName);
            
            if (self.changenameblock) {
                
                self.changenameblock(lastestName);
            }
            
            
            NSDictionary * pinfo = @{@"newname":lastestName};
            
            [self UpdatePersonInfoSubmitServerWithDictionary:pinfo];
            
        } WithCancelButtonBlcok:^{
            
        
        }];
        
    }
    
    //时间选择权
    if (indexPath.section == 1 && indexPath.row == 2) {
        
        [[BLDatePickerView share]BLDataPickerViewWithTitle:@"修改生日" WithSureBlock:^(NSString *currentDate) {
            
            NSLog(@"当前日期:%@",currentDate);
            
            if (self.currentDataBlock) {
                
                self.currentDataBlock(currentDate);
            }
            
            
        } WithCancelBlock:^{
            
            
        }];
    
    }

    if (indexPath.section == 1 && indexPath.row == 3) {
        
        [[BLDatePickerView share] BLDataPickerViewWithTitle:@"选择性别" WithSureBlock:^(NSString *currentDate) {
            
            NSLog(@"选中性别:%@",currentDate);
            
            if (self.selectedSextBlock) {
                
                self.selectedSextBlock(currentDate);
            }
        } WithCancelBlock:^{
            
            
        }];
    }


}
-(void)UpdatePersonInfoSubmitServerWithDictionary:(NSDictionary *)dictionary{

    NSString * password = [[NSUserDefaults standardUserDefaults] valueForKey:@"password"];
    NSString * username = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    NSString * newname = [[NSUserDefaults standardUserDefaults] valueForKey:@"newname"];
    
    NSString * urlstr = [NSString stringWithFormat:@"http://localhost:63342/MySql/UserSet.php?username=%@&passwordlog=%@&newname=%@",username,password,newname];
    
   [AFNetRequestManager PostRequestWithURLString:urlstr WithParameter:nil WithSuccessBlock:^(id object) {
      
       NSLog(@"响应数据:%@",object);
       
   } WithFailureBlock:^(NSError *error) {
      
   }];

}
//照相机照完相或者从相册取完相片后走的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    NSLog(@"照相机信息:%@",info);
    NSString * password = [[NSUserDefaults standardUserDefaults] valueForKey:@"password"];
    NSString * username = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //保存在沙河中
    [self saveHeaderImageToSaHeWith:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];

    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    self.userpersonimage.image = savedImage;
    NSString * url = [NSString stringWithFormat:@"http://localhost:63342/MySql/UserSet.php"];
    
    
    //****************************************图像上传***********************************
    
    [AFNetRequestManager Post:url image:savedImage name:@"filedata" WithSuccessBlock:^(id object) {
        
        
        NSLog(@"图片上传成功请求的数据:%@",object);
        
    } WithFailureBlock:^(NSError *error) {
        
        NSLog(@"图片上传失败返回数据:%@",error.localizedDescription);
        
        
    }];
    
    

    

}
//先保存至沙盒中
-(void)saveHeaderImageToSaHeWith:(UIImage *)CurrentImage withName:(NSString *)imageName{

    //0.5倍数压缩
    NSData * imageData = UIImageJPEGRepresentation(CurrentImage, 0.5);
    
    NSString * filepath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];

    //将图片保存到这个路径下
    [imageData writeToFile:filepath atomically:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
