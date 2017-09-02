//
//  Utils.h
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(NSString*) systemNowTimeFormateBy_YYYYMMDDHHMMSSSSS;


/**
 *  MARK:--------------------起名字--------------------
 */
+(NSString*) createName;


/**
 *  MARK:--------------------将idValue转换成idStr--------------------
 */
+(NSString*) getIdStrWithIdValue:(NSInteger)idValue;
+(NSString*) getAILineIdStrWithIdValue:(NSInteger)idValue;


/**
 *  MARK:--------------------区域点亮--------------------
 */
+(NSMutableArray*) areaLight:(AIDictionary*)dic energy:(NSInteger)energy invalidDics:(NSArray*)invalidDics;

@end
