//
//  ControlWindow.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ControlWindowDelegate <NSObject>

-(void) controlWindow_Log:(NSString*)log;

@end

@interface ControlWindow : UIView

@property (weak, nonatomic) id<ControlWindowDelegate> delegate;
-(void) open;
-(void) close;
-(NSInteger) getRelationDensityNum;
-(NSInteger) getSelectMaxNum;

@end
