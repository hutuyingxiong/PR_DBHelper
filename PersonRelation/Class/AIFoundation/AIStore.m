//
//  AIStore.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIStore.h"
#import "PINCache.h"

@implementation AIStore

/**
 *  MARK:--------------------生产神经网络--------------------
 */
+(AILine*) createLine:(NSArray*)pointers type:(AILineType)type updateObjs:(BOOL)updateObjs{
    if (ARRISOK(pointers)) {
        return nil;
    }else{
        NSLog(@"_______SMGUtils.CreateLine.ERROR (pointersIsNil!)");
        return nil;
    }
}


/**
 *  MARK:--------------------存AIObject--------------------
 */
+(void) store_Insert:(AIObject*)obj {
    if (ISOK(obj, AIObject.class) && POINTERISOK(obj.pointer)) {
        [[[PINDiskCache alloc] initWithName:@"" rootPath:obj.pointer.filePath] setObject:obj forKey:obj.pointer.fileName];
    }
}

@end
