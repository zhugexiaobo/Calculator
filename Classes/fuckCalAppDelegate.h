//
//  fuckCalAppDelegate.h
//  fuckCal
//
//  Created by zhugexiaobo on 12-6-9.
//  Copyright 2012 zhugexiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class fuckCalViewController;

@interface fuckCalAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    fuckCalViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet fuckCalViewController *viewController;

@end

