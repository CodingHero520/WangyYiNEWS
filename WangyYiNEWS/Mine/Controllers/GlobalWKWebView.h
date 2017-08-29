//
//  GlobalWKWebView.h
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/23.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import <WebKit/WebKit.h>

typedef void(^ChangeVerfityButton)(NSString * verfityText,NSInteger statusCode);

@interface GlobalWKWebView : WKWebView

@property (nonatomic , copy)ChangeVerfityButton VerfityButtonBlock;
@end
