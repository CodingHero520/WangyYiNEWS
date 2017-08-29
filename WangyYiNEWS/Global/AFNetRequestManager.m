//
//  AFNetRequestManager.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "AFNetRequestManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
@interface AFNetRequestManager ()

@end
@implementation AFNetRequestManager
static  AFNetRequestManager * instance = nil;
static  AFHTTPSessionManager * manager = nil;
+(instancetype)allocWithZone:(struct _NSZone *)zone{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self allocWithZone:zone];
        
    });

    return instance;
}

+(instancetype)share{


    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });

    return instance;
}
-(id)copyWithZone:(NSZone *)zone{

    return instance;

}

+(AFHTTPSessionManager *)sharemanager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        manager.requestSerializer.timeoutInterval = 10;
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",@"text/json",@"text/plain",@"text/xml",@"text/javascript", nil];
    });
    
    return manager;

}
+(void)PostRequestWithURLString:(NSString *)urlStr WithParameter:(NSDictionary *)parameters WithSuccessBlock:(SuccessfulBlock)sussessful WithFailureBlock:(FailureBlcok)failure{


    AFHTTPSessionManager * manager = [AFNetRequestManager sharemanager];
    
    [manager POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
     sussessful(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
}
@end
