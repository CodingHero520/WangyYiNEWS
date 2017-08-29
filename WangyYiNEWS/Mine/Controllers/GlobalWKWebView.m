//
//  GlobalWKWebView.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/23.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "GlobalWKWebView.h"
#define kInputFromiOS @"kInputFromiOS"
@interface GlobalWKWebView ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>


@end
@implementation GlobalWKWebView

-(instancetype)initWithFrame:(CGRect)frame{
    
    //配置config
    WKWebViewConfiguration *congfig = [[WKWebViewConfiguration alloc]init];
    // 设置偏好设置
    // 默认为0
    congfig.preferences.minimumFontSize = 10;
    // 默认认为YES
    congfig.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    congfig.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    // web内容处理池
    congfig.processPool = [[WKProcessPool alloc] init];
    // 通过JS与webview内容交互
    congfig.userContentController = [[WKUserContentController alloc] init];
    // 注入JS对象名称AppModel，当JS通过kInputFromiOS来调用时，
    // 我们可以在WKScriptMessageHandler代理中接收到
    [congfig.userContentController addScriptMessageHandler:self name:@"kInputFromiOS"];
    congfig.preferences = [[WKPreferences alloc] init];
    self = [super initWithFrame:frame configuration:congfig];
    if (self) {
        self.navigationDelegate = self;
        self.UIDelegate = self;
        self.backgroundColor = [UIColor clearColor];
        
}
    return self;
}


#pragma mark --  WKNavigationDelegate代理方法
#warning 改代理提供的方法，可以用来追踪加载的过程(界面加载，加载完成，加载失败),决定是否执行跳转
//界面开始加载的时候调用
//-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
//
//
//
//}
////当界面开始返回的时候调用
//-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
//
//
//}
////页面加载完成之后调用
//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//
//
//
//}
////页面加载失败时调用
//-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
//
//
//
//}
//#warning 界面跳转的方法分为三种，（收到跳转与决定是否跳转）
////接受到服务器跳转请求之后调用
//-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
//
//
//}
////在发送请求之前，决定是否调转
//-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//
//
//}
////在收到响应之后，决定是否跳转
//-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//
//
//
//}
//#pragma mark -- WKUIDelegate代理方法
//#pragma mark -- WKScriptMessageHandler
////这个协议包含一个必须实现的方法，这个方法是native与web端交互的关键，他可以直接接受道的JS脚本转化为oc对像
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{

    NSDictionary * dictionary = message.body;
    
    if ([message.name isEqualToString:@"kInputFromiOS"]) {
        
        if ([dictionary[@"response_code"] integerValue] == 1) {
            
            if (self.VerfityButtonBlock) {
                
                self.VerfityButtonBlock(dictionary[@"status_text"],[dictionary[@"response_code"] integerValue]);
            }
            
        }
        
        if ([dictionary[@"response_code"]integerValue] == 0) {
            
            if (self.VerfityButtonBlock) {
                
                self.VerfityButtonBlock(dictionary[@"status_text"],[dictionary[@"response_code"] integerValue]);
            }
        }
        
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
