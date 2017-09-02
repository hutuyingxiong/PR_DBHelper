//
//  AIDictionary.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIObject.h"

@interface AIDictionary : AIObject


-(id) initWithDictionary:(NSDictionary *)otherDic withPointer:(AIPointer*)pointer;
-(NSMutableDictionary *)dic;
- (id)objectForKey:(NSString *)key;

@end
