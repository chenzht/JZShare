//
//  JZViewController.m
//  JZShareCustom_Demo
//
//  Created by Jozo'Mac on 16/5/27.
//  Copyright © 2016年 i.Jozo. All rights reserved.
//

#import "JZViewController.h"
#import "JZShareCustom.h"
/**
 @author Jozo, 16-05-24 12:05:09
 
 导入ShareSDK分享功能
 */
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDKConnector/ShareSDKConnector.h>




@interface JZViewController ()

@end

#define UIColorFromRGBB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation JZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    /**
     @author Jozo, 16-05-27 14:05:33
     
     添加分享按钮
     */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 80) / 2.0, ([UIScreen mainScreen].bounds.size.height - 80) / 2.0, 80, 80);
    btn.layer.cornerRadius = 40;
    btn.backgroundColor = [self randomColor];
    
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"分享" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goShareAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    
    
    /**
     *  @author i.Jozo, 16-05-27 16:05:00
     *
     *  背景UI，为了看清毛玻璃效果
     */
    
    NSArray *widthArr = @[@40, @60, @70, @50, @70, @30, @55, @50];
    NSArray *xArr = @[@30, @90, @40, @60, @200, @260, @260, @200];
    NSArray *yArr = @[@30, @160, @230, @240, @450, @430, @40, @100];
    
    for (int i = 0; i < 8; i++) {
        
        CGFloat x = [xArr[i] floatValue];
        CGFloat y = [yArr[i] floatValue];
        CGFloat width = [widthArr[i] floatValue];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, width)];
        lbl.layer.cornerRadius = width / 2.0;
        lbl.layer.masksToBounds = YES;
        lbl.backgroundColor = [self randomColor];
        [self.view addSubview:lbl];
        
    }
    
    
    
}


- (void)goShareAction:(UIButton *)sender {
    
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"分享_bg"]];
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"JZShare，自定义你的Mob分享UI"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://www.kohmax.com"]
                                          title:@"JZShare"
                                           type:SSDKContentTypeAuto];
        
        
        //调用自定义分享
        [JZShareCustom shareWithContent:shareParams];
    }
    
}


- (UIColor *)randomColor
{
    NSArray *colorArr = @[@"0x74bef2", @"0x8297b6", @"0x78919d", @"0x6bb5ce", @"0x63cfce", @"0xf081a3", @"0x5ec9f6", @"0xedbd6a", @"0xc6b2cf", @"0x66cccc", @"0xff993e", @"0xffc600", @"0xa9d345", @"0x6ac66f", @"0xf6c059", @"0xdf6565", @"0x5ec9f6", @"0x16dbad"];
    
    // 取手机号最后两位
    int value =  arc4random() % 16;
    
    unsigned long d = strtoul([colorArr[value%18] UTF8String], 0, 16);
    
    return UIColorFromRGBB(d);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
