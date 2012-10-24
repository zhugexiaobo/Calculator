//
//  fuckCalViewController.m
//  fuckCal
//
//  Created by zhugexiaobo on 12-6-9.
//  Copyright 2012 zhugexiaobo. All rights reserved.
//



#import "fuckCalViewController.h"

@implementation fuckCalViewController

@synthesize result;
@synthesize plusBtn;
@synthesize minusBtn;
@synthesize multiplyBtn;
@synthesize divideBtn;
@synthesize clearBtn;

@synthesize storage;
@synthesize tempResult;
@synthesize operat;

- (void) viewDidLoad
{
	result.text = @"0";
	self.operat = @"";
	self.storage = @"";
	clearFlag = NO;
	dotFlag = NO;
    allClearFlag = NO;
}

- (IBAction)information:(UIButton *)sender
{
    UIAlertView *infoAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Fuckcal  v1.0\n By xiaobo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [infoAlert show];
    [infoAlert release];
}


- (IBAction) numPressed: (UIButton *) sender
{
    [plusBtn setHighlighted:NO];
    [minusBtn setHighlighted:NO];
    [multiplyBtn setHighlighted:NO];
    [divideBtn setHighlighted:NO];
    [clearBtn setTitle:@"C" forState:UIControlStateNormal];
    allClearFlag = NO;
	if (clearFlag || [result.text isEqualToString:@"出错"])//是否清除屏幕
	{
		result.text = @"0";
		clearFlag = NO;
	}
	if (result.text.length >= 10) {
        return;
    }
	switch (sender.tag)
	{
		case 0:
		{
			if ([result.text isEqualToString:@"0"])//屏幕为0时，无法输入0
			{
				return;
			}
			else
				result.text = [NSString stringWithFormat:@"%@0", result.text];
		}
			break;
		case 1:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@1", result.text];
		}
			break;
		case 2:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@2", result.text];
		}
			break;
		case 3:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@3", result.text];
		}
			break;
		case 4:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@4", result.text];
		}
			break;
		case 5:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@5", result.text];
		}
			break;
		case 6:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@6", result.text];
		}
			break;
		case 7:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@7", result.text];
		}
			break;
		case 8:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@8", result.text];
		}
			break;
		case 9:
		{
			if ([result.text isEqualToString:@"0"])
			{
				result.text = [NSString stringWithFormat:@""];
			}
			result.text = [NSString stringWithFormat:@"%@9", result.text];
		}
			break;
        case -1:
        {
            if (dotFlag) {
                return;
            }
            result.text = [NSString stringWithFormat:@"%@.", result.text];
            dotFlag = YES;
        }
			
		default:
			break;
	}
	
}

//去除float结果小数点后无效的0
- (NSString *) changeFloat: (NSString *) stringFloat
{
	const char *floatChars = [stringFloat UTF8String];
    NSUInteger length = [stringFloat length];
    NSUInteger zeroLength = 0;
    int i = length-1;
    for( ; i >= 0; i --)
    {
        if(floatChars[i] == '0'/*0x30*/)
        {
            zeroLength++;
        }
        else if(floatChars[i] != '0')
        {           
            //i--;
            break;
        }
    }
    NSString *returnString;
    if(i == -1) {
        returnString = @"0";
    }
    else {
        returnString = [stringFloat substringToIndex:i+1];
    }
    return returnString;
}


//计算
- (void) calculat
{
		
	if ([operat isEqualToString:@"+"])
	{
		self.tempResult = [NSString stringWithFormat:@"%@", result.text];
        //NSLog(@"%@",result.text);
		result.text = [NSString stringWithFormat:@"%g", [self.storage floatValue] + [result.text floatValue]];
        //result.text = [self changeFloat:result.text];        
		clearFlag = YES;
		self.storage = [NSString stringWithFormat:@"%@", result.text];
		self.operat = @"";
	}	
	else if ([operat isEqualToString:@"-"])
	{
		self.tempResult = [NSString stringWithFormat:@"%@", result.text];
		result.text = [NSString stringWithFormat:@"%g", [self.storage floatValue] - [result.text floatValue]];
		//result.text = [self changeFloat:result.text];
        clearFlag = YES;
		self.storage = [NSString stringWithFormat:@"%@", result.text];
		self.operat = @"";
	}
	else if ([operat isEqualToString:@"×"])
	{
		self.tempResult = [NSString stringWithFormat:@"%@", result.text];
		result.text = [NSString stringWithFormat:@"%g", [self.storage floatValue] * [result.text floatValue]];
		//result.text = [self changeFloat:result.text];
        clearFlag = YES;
		self.storage = [NSString stringWithFormat:@"%@", result.text];
		self.operat = @"";
	}
	else if ([operat isEqualToString:@"÷"])
	{
		self.tempResult = [NSString stringWithFormat:@"%@", result.text];
		result.text = [NSString stringWithFormat:@"%g", [self.storage floatValue] / [result.text floatValue]];
		//result.text = [self changeFloat:result.text];
        clearFlag = YES;
		self.storage = [NSString stringWithFormat:@"%@", result.text];
		self.operat = @"";
	}
}

//高亮被按下的运算符
- (void) highlightBtn: (id) sender
{
    UIButton *btn = (UIButton *)sender;
    [btn setHighlighted:YES];
}


//按下运算符时将当前屏幕上的数存入storage
- (IBAction) calculatPressed: (UIButton *) sender
{
	if ([self.operat isEqualToString:@"÷" ] && [result.text isEqualToString:@"0"])
	{
		result.text = [NSString stringWithFormat:@"出错"];
		return;
	}

    dotFlag = NO;
	
	switch (sender.tag)
	{
		case 11:
		{
            [self performSelector:@selector(highlightBtn:) withObject:sender afterDelay:0.0];
			if ([operat isEqualToString:@""])
			{
				self.storage = result.text;
				self.operat = @"+";
				clearFlag = YES;
				return;
			}
			else
			{
				[self calculat];
				self.operat = @"+";
			}
			
			//self.storage = [NSString stringWithFormat:@"%@", result.text];
			//clearFlag = YES;
		}
			break;
		case 12:
		{            
            [self performSelector:@selector(highlightBtn:) withObject:sender afterDelay:0.0];
			if ([operat isEqualToString:@""])
			{
				self.storage = result.text;
				self.operat = @"-"; 
				clearFlag = YES;
				return;
			}
			else
			{
				
				[self calculat];
				self.operat = @"-";
			}

			//self.storage = [NSString stringWithFormat:@"%@", result.text];			
			//clearFlag = YES;
		}
			break;
		case 13:
		{
            [self performSelector:@selector(highlightBtn:) withObject:sender afterDelay:0.0];
			if ([operat isEqualToString:@""])
			{
				self.storage = result.text;
				self.operat = @"×";
				clearFlag = YES;
				return;
			}
//			else if ([operat isEqualToString:@"+"] && [operat isEqualToString:@"-"])
//			{
//				self.storage = result.text;
//				self.operat = @"×";
//				
//				//[self calculat];
//			}
			else
			{
				[self calculat];
				self.operat = @"×";
			}

			//self.storage = [NSString stringWithFormat:@"%@", result.text];			
			//clearFlag = YES;			
		}
			break;
		case 14:
		{            
            [self performSelector:@selector(highlightBtn:) withObject:sender afterDelay:0.0];
			if ([operat isEqualToString:@""])
			{
				self.storage = result.text;
				self.operat = @"÷";
				clearFlag = YES;
				return;
			}
			else
			{
				
				[self calculat];
				self.operat = @"÷";
			}

			//self.storage = [NSString stringWithFormat:@"%@", result.text];			
			//clearFlag = YES;
		}
			break;
		case 10:
		{
            [plusBtn setHighlighted:NO];
            [minusBtn setHighlighted:NO];
            [multiplyBtn setHighlighted:NO];
            [divideBtn setHighlighted:NO];
            dotFlag = NO;
			[self calculat];
			self.operat = @"";
			self.tempResult = [NSString stringWithFormat:@"%@", result.text];
		}	
			break;
			
		default:
			break;
	}
	
	
	
	
}



//按下等号时将storage中的数与当前屏幕上的数进行运算
//- (IBAction) equalPressed: (UIButton *) sender
//{
//	if ([operat isEqualToString:@"+"])
//	{
//		result.text = [NSString stringWithFormat:@"%lli", [self.storage longLongValue] + [result.text longLongValue]];
//		clearFlag = YES;
//	}
//	else if ([operat isEqualToString:@"-"])
//	{
//		result.text = [NSString stringWithFormat:@"%lli", [self.storage longLongValue] - [result.text longLongValue]];
//		clearFlag = YES;
//	}
//	else if ([operat isEqualToString:@"*"])
//	{
//		result.text = [NSString stringWithFormat:@"%lli", [self.storage longLongValue] * [result.text longLongValue]];
//		clearFlag = YES;
//	}
//	else if ([operat isEqualToString:@"/"])
//	{
//		result.text = [NSString stringWithFormat:@"%lli", [self.storage longLongValue] / [result.text longLongValue]];
//		clearFlag = YES;
//		
//	}
//	
//	
//	
//}

//清除
- (IBAction) clearPressed: (UIButton *) sender
{
	[sender setTitle:@"AC" forState:UIControlStateNormal];
    [plusBtn setHighlighted:NO];
    [minusBtn setHighlighted:NO];
    [multiplyBtn setHighlighted:NO];
    [divideBtn setHighlighted:NO];
	dotFlag = NO;
	if (!allClearFlag)
	{
		result.text = @"0";
		allClearFlag = YES;
        return;
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	else if (allClearFlag)
	{
		result.text = @"0";
		self.operat = @"";
		self.storage = @"";
		allClearFlag = NO;
        return;
	}
    
}


//正负号
- (IBAction) pmBtnPressed: (UIButton *) sender
{
//	self.temp = [NSMutableString stringWithFormat:@"%@", result.text];
//	NSRange subStr = [temp rangeOfString:@"-"];
	
	if ([result.text longLongValue] < 0)
	{
		
		result.text = [NSString stringWithFormat:@"%lf", fabs([result.text doubleValue])];
	}
	else if ([result.text longLongValue] > 0)
	{
		result.text = [NSString stringWithFormat:@"-%@", result.text];
	}

	
	
}



/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
/*
 - (void)viewDidUnload {
 // Release any retained subviews of the main view.
 // e.g. self.myOutlet = nil;
 }
 */

- (void)dealloc 
{
	[result release];
	[operat release];
	[storage release];
	[tempResult release];
	
    [super dealloc];
}

@end
