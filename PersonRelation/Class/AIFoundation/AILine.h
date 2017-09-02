//
//  AILine.h
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMGEnum.h"
#import "AIObject.h"

/**
 *  MARK:--------------------网线--------------------
 *
 *  注:在本项目以这样的方式简化逻辑,其实AILine的type应当是data指针类型的;其值指向另一个网络抽象节点;
 */
@interface AILine : AIObject

-(id) initWithAIPort:(AIPort*)port withType:(AILineType)type;
-(id) initWithPointers:(NSArray*)pointers withType:(AILineType)type;
-(AILineType) type;
-(NSInteger) strong;


@end
