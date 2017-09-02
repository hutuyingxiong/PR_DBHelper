//
//  AIPointer.h
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  MARK:--------------------指针--------------------
 *  注:在本项目中,指针使用idStr;
 */
@interface AIPointer : NSObject <NSCoding>

@property (strong,nonatomic,readonly) NSString *content;
-(id) initWithString:(NSString*)content;


/**
 *  MARK:--------------------文件路径--------------------
 */
-(NSString*) filePath;


/**
 *  MARK:--------------------文件名--------------------
 */
-(NSString*) fileName;


/**
 *  MARK:--------------------override--------------------
 */
-(NSInteger)length;

-(BOOL)isEqual:(AIPointer*)object;

@end
