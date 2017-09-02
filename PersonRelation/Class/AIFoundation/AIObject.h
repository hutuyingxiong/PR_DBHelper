//
//  AIObject.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIPort,AIPointer,AILine;
@interface AIObject : NSObject <NSCoding>

@property (strong,nonatomic) AIPort *port;
@property (strong,nonatomic) AIPointer *pointer;


/**
 *  MARK:--------------------插网线--------------------
 *  每次产生神经网络的时候,要把网线插在网口上;
 */
-(void) connectLine:(AILine*)line save:(BOOL)save;

@end
