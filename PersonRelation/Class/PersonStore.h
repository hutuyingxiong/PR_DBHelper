//
//  PersonStore.h
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  MARK:--------------------临时人员Store类--------------------
 *  1. 依次0000000000000往后生成的;
 *  2. 关系也是随机生成的;
 *  3. 随机生成的关系是未判断的;(因为是临时的)
 *  4. AILine的Id是"L0000000000000"往后生成的;
 */
@interface PersonStore : NSObject

//MARK:===============================================================
//MARK:                     < 生产原始数据 >
//MARK:===============================================================

/**
 *  MARK:--------------------kv+Path方式存储--------------------
 *  @param count : 创建数
 *  @param relationDensityNum : 关联密度
 *  @param singleComplete : 分条回调
 */
+(void) createOriPerson_KVPath:(NSInteger)count relationDensityNum:(NSInteger)relationDensityNum singleComplete:(void(^)(CGFloat progress))singleComplete;


//MARK:===============================================================
//MARK:                     < 读取原始数据 >
//MARK:===============================================================

/**
 *  MARK:--------------------取数据--------------------
 *  注:当前可能返回AIDictionary或AILine
 */
+(AIObject*) getPerson_KVPathWithValue:(NSInteger)idValue;
+(AIObject*) getPerson_KVPathWithPointer:(AIPointer*)pointer;


//MARK:===============================================================
//MARK:                     < 清除 >
//MARK:===============================================================

+(void) clear;

@end
