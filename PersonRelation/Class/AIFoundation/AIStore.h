//
//  AIStore.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIObject.h"

@interface AIStore : AIObject

/**
 *  MARK:--------------------生产神经网络--------------------
 *  注://暂未使用
 */
+(AILine*) createLine:(NSArray*)pointers type:(AILineType)type updateObjs:(BOOL)updateObjs;


/**
 *  MARK:--------------------存AIObject--------------------
 */
+(void) store_Insert:(AIObject*)obj;


@end
