//
//  ViewController.m
//  html5
//
//  Created by James on 16/6/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"
#import "APIWindowContainer.h"
#import "APIEvent.h"
#import "APIWebView.h"
#import "APIScriptMessage.h"
#import "APIModuleMethod.h"
@interface ViewController ()<APIWebViewDelegate, APIModuleMethodDelegate, APIScriptMessageDelegate>
@property (nonatomic, strong) APIWindowContainer *windowContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[APIManager manager] setWebViewDelegate:self];
    [[APIManager manager] setModuleMethodDelegate:self];
    [[APIManager manager] setScriptMessageDelegate:self];
    //消息中心,用于发送消息和接收消息
    [[APIEventCenter defaultCenter] addEventListener:self selector:@selector(handleEvent:) name:@"abc"];//添加监听
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClick:(id)sender {
//    NSString *url = @"widget://index.html";
        NSString *url = @"https://www.baidu.com";
    APIWindowContainer *windowContainer = [APIWindowContainer windowContainerWithUrl:url name:@"root" userInfo:nil];
    [windowContainer startLoad];
    windowContainer.view.backgroundColor =[UIColor whiteColor];
    [self.navigationController pushViewController:windowContainer animated:YES];
    self.windowContainer = windowContainer;
}

- (void)handleEvent:(APIEvent *)event {
    
}
@end
