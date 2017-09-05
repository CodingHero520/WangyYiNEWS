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
        
        manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"POST", @"GET", @"HEAD"]];
        
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
//对图片进行压缩
+(void)Post:(NSString *)url image:(id)image name:(NSString *)name WithSuccessBlock:(SuccessfulBlock)success WithFailureBlock:(FailureBlcok)failure{

    
    AFHTTPSessionManager * manager = [AFNetRequestManager sharemanager];

    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //对图片进行压缩
        NSData * imageData = UIImageJPEGRepresentation(image, 0.5);
        
        //使用日期生成的图片名称
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];

        formatter.dateFormat = @"yyyyMMddHHmmss";

        NSString * filename = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        
//        任意的二进制数据MIMEType application/octet-stream
        [formData appendPartWithFileData:imageData name:name fileName:filename mimeType:@"image/png"];
        
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
        
        
    }];
    

}

@end
