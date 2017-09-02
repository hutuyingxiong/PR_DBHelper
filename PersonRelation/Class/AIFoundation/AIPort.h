//
//  AIPort.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  MARK:--------------------网口--------------------
 */
@interface AIPort : NSObject <NSCoding>

-(id) initWithArray:(NSArray*)arr;
-(NSMutableArray*) pointers;//插线aiLine

/**
 *  MARK:--------------------判断是否插了某网线--------------------
 */
-(BOOL) containsLine:(AILine*)line;
-(BOOL) connectLine:(AILine*)line;  //插线

@end
