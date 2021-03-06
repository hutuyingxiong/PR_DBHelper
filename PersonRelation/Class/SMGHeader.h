//
//  SMGHeader.h
//  SMG_NothingIsAll
//
//  Created by 贾  on 2017/4/8.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AILine.h"
#import "AIDictionary.h"
#import "Utils.h"
#import "SMGEnum.h"
#import "AIObject.h"
#import "AIPointer.h"
#import "AIPort.h"
#import "AIStore.h"

/**
 *  MARK:--------------------ObserverKEY--------------------
 */

/**
 *  MARK:--------------------数据检查--------------------
 */

//String
#define STRISOK(a) (a  && ![a isKindOfClass:[NSNull class]] && [a isKindOfClass:[NSString class]] && ![a isEqualToString:@""])//是否空字符串
#define STRTOOK(a) (a  && ![a isKindOfClass:[NSNull class]]) ? ([a isKindOfClass:[NSString class]] ? a : [NSString stringWithFormat:@"%@", a]) : @""
#define STRFORMAT(a, ...) [NSString stringWithFormat:a, ##__VA_ARGS__]//String.format

//Array
#define ARRISOK(a) (a  && [a isKindOfClass:[NSArray class]] && a.count)//是否空数组
#define ARRTOOK(a) (a  && [a isKindOfClass:[NSArray class]]) ?  a : [NSArray new]
#define ARR_INDEX(a,i) (a && [a isKindOfClass:[NSArray class]] && a.count > i) ?  a[i] : nil//数组取子防闪

//NSNumber
#define NUMISOK(a) (a  && [a isKindOfClass:[NSNumber class]])//是否有效NSNumber
#define NUMTOOK(a) (a  && [a isKindOfClass:[NSNumber class]]) ? a : @(0)

//Dic
#define DICISOK(a) (a  && [a isKindOfClass:[NSDictionary class]] && a.count)//是否空字典
#define DICTOOK(a) (a  && [a isKindOfClass:[NSDictionary class]]) ?  a : [NSDictionary new]

//AILine
#define LINEISOK(a) (a  && [a isKindOfClass:[AILine class]])

//AIPointer
#define POINTERISOK(a) (a && [a isKindOfClass:[AIPointer class]] && STRISOK(a.content))

//ISOK
#define ISOK(a, c) (a && [a isKindOfClass:c])

/**
 *  MARK:--------------------快捷建对象--------------------
 */

//AILine
#define AIMakeLine(objs,type) [[AILine alloc] initWithPointers:objs withType:type]


/**
 *  MARK:--------------------快捷访问对象--------------------
 */
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

