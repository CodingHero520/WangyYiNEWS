//
//  AFNetRequestManager.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^SuccessfulBlock)(id object);
typedef void(^FailureBlcok)(NSError * error);

@interface AFNetRequestManager : NSObject

@property (nonatomic , copy)SuccessfulBlock successblock;
@property (nonatomic , copy)FailureBlcok failblock;

+(void)PostRequestWithURLString:(NSString *)urlStr WithParameter:(NSDictionary *)parameters WithSuccessBlock:(SuccessfulBlock )sussessful WithFailureBlock:(FailureBlcok )failure;

+(void)Post:(NSString *)url image:(UIImage *)image name:(NSString *)name WithSuccessBlock:(SuccessfulBlock)success WithFailureBlock:(FailureBlcok )failure;


@end
