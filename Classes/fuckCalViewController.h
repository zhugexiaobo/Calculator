//
//  fuckCalViewController.h
//  fuckCal
//
//  Created by zhugexiaobo on 12-6-9.
//  Copyright 2012 zhugexiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fuckCalViewController : UIViewController 
{
	UILabel *result;//屏幕显示
		
	UIButton *plusBtn;//加
	UIButton *minusBtn;//减
	UIButton *multiplyBtn;//乘
	UIButton *divideBtn;//除
    UIButton *clearBtn;//清除
	
	NSString *storage;//储存运算符前数字
	NSString *tempResult;//存储前一次的结果
	NSString *operat;//运算符
	
	BOOL clearFlag;//是否清除屏幕
	BOOL dotFlag;//是否有小数点
    BOOL allClearFlag;//AC或者C
}

@property (retain, nonatomic) IBOutlet UILabel *result;
@property (retain, nonatomic) IBOutlet UIButton *plusBtn;
@property (retain, nonatomic) IBOutlet UIButton *minusBtn;
@property (retain, nonatomic) IBOutlet UIButton *multiplyBtn;
@property (retain, nonatomic) IBOutlet UIButton *divideBtn;
@property (retain, nonatomic) IBOutlet UIButton *clearBtn;

@property (retain, nonatomic) NSString *storage;
@property (retain, nonatomic) NSString *tempResult;
@property (retain, nonatomic) NSString *operat;

- (IBAction) numPressed: (UIButton *) sender;//数字按键

- (IBAction) calculatPressed: (UIButton *) sender;//运算符按键

//- (IBAction) equalPressed: (UIButton *) sender;//=按键

- (IBAction) clearPressed: (UIButton *) sender;//清除按键

- (IBAction) pmBtnPressed: (UIButton *) sender;//正负号

- (NSString *) changeFloat: (NSString *) stringFloat;//

@end

