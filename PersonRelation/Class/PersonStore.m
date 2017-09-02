//
//  PersonStore.m
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "PersonStore.h"
#import "SMGHeader.h"
#import "PINCache.h"

#define CreateOriPerson_LastID_KEY_KVPath   @"CreateOriPerson_LastID_KEY_KVPath"
#define CreateOriPerson_LastID_KEY_AILine   @"CreateOriPerson_LastID_KEY_AILine"

@implementation PersonStore

//MARK:===============================================================
//MARK:                     < 生产原始数据 >
//MARK:===============================================================

/**
 *  MARK:--------------------kv+Path方式存储--------------------
 *  @param count : 创建数
 *  @param relationDensityNum : 关联密度
 *  @param singleComplete : 分条回调
 */
+(void) createOriPerson_KVPath:(NSInteger)count relationDensityNum:(NSInteger)relationDensityNum singleComplete:(void(^)(CGFloat progress))singleComplete{
    //1,取lastId
    NSInteger lastId = [[NSUserDefaults standardUserDefaults] integerForKey:CreateOriPerson_LastID_KEY_KVPath];
    NSInteger lastAILineId = [[NSUserDefaults standardUserDefaults] integerForKey:CreateOriPerson_LastID_KEY_AILine];
    
    
    NSInteger progressCount = 0;//按1000个每次回收内存分段
    while (progressCount < count) {
        @autoreleasepool {
            //2,生产原始数据
            for (NSInteger i = 0; i < 1000; i++) {
                //2.1,生成随机名字 & idStr
                NSString *nameStr = [Utils createName];
                NSString *idStr = [Utils getIdStrWithIdValue:++lastId];
                
                //2.2,生成dic
                AIPointer *pointer = [[AIPointer alloc] initWithString:STRTOOK(idStr)];
                AIDictionary *dic = [[AIDictionary alloc] initWithDictionary:@{@"Id":STRTOOK(idStr),@"Name":STRTOOK(nameStr)} withPointer:pointer];
                
                //2.3,生成关系
                if (random() % MAX(0, relationDensityNum) == 0) {
                    //1. 生成relationId
                    NSInteger relationId = random() % lastId;
                    
                    //2. 生成relationPointer
                    NSString *relationIdStr = [Utils getIdStrWithIdValue:relationId];
                    AIPointer *relationPointer = [[AIPointer alloc] initWithString:STRTOOK(relationIdStr)];
                    
                    //3. 创建网线
                    NSArray *pointers = @[pointer,relationPointer];
                    AILine *line = AIMakeLine(pointers, AILineType_X);
                    
                    //4. 创建AILinePointer
                    NSString *aiLineIdStr = [Utils getAILineIdStrWithIdValue:++lastAILineId];
                    AIPointer *aiLinePointer = [[AIPointer alloc] initWithString:STRTOOK(aiLineIdStr)];
                    line.pointer = aiLinePointer;
                    
                    //5. 存AILine
                    [AIStore store_Insert:line];
                    
                    //6. relation插网线
                    AIObject *relationObj = [self getPerson_KVPathWithPointer:relationPointer];
                    if (ISOK(relationObj, AIDictionary.class)) {
                        AIDictionary *relationDic = (AIDictionary*)relationObj;
                        [relationDic connectLine:line save:true];
                    }
                    
                    //7. pointer插网线
                    [dic connectLine:line save:false];
                }
                
                //2.4,存储
                [[[PINDiskCache alloc] initWithName:@"" rootPath:pointer.filePath] setObject:dic forKey:pointer.fileName];
                
                //2.5,计数器++
                progressCount ++;
                
                //2.6,回调
                if (singleComplete) singleComplete((CGFloat)(progressCount)/(CGFloat)count);
                
                //2.7,检查完成
                if (progressCount >= count) {
                    break;
                }
            }
        }
    }
    
    //3,存lastId
    [[NSUserDefaults standardUserDefaults] setInteger:lastId forKey:CreateOriPerson_LastID_KEY_KVPath];
    [[NSUserDefaults standardUserDefaults] setInteger:lastAILineId forKey:CreateOriPerson_LastID_KEY_AILine];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



//MARK:===============================================================
//MARK:                     < 读取原始数据 >
//MARK:===============================================================

+(AIObject*) getPerson_KVPathWithValue:(NSInteger)idValue {
    NSString *idStr = [Utils getIdStrWithIdValue:idValue];
    AIPointer *pointer = [[AIPointer alloc] initWithString:idStr];
    return [self getPerson_KVPathWithPointer:pointer];
}

+(AIObject*) getPerson_KVPathWithPointer:(AIPointer*)pointer{
    if (POINTERISOK(pointer)) {
        return [[[PINDiskCache alloc] initWithName:@"" rootPath:pointer.filePath] objectForKey:pointer.fileName];
    }
    return nil;
}


//MARK:===============================================================
//MARK:                     < 清除 >
//MARK:===============================================================

+(void) clear{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSMutableString *kvPath = [[NSMutableString alloc] initWithFormat:@"%@/KVPath",cachePath];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    [mgr removeItemAtPath:STRTOOK(kvPath) error:nil];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:CreateOriPerson_LastID_KEY_KVPath];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:CreateOriPerson_LastID_KEY_AILine];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
