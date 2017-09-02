//
//  LogWindow.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogWindow : UIView

-(void) open;
-(void) close;
-(void) appendLog:(NSString*)log;

@end
