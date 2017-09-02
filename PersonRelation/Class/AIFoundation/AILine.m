//
//  AILine.m
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AILine.h"

@interface AILine ()

@property (assign, nonatomic) AILineType type;
@property (assign,nonatomic) NSInteger strong;

@end

@implementation AILine

-(id) initWithAIPort:(AIPort*)port withType:(AILineType)type{
    self = [super init];
    if (self) {
        self.port = port;
        self.type = type;
    }
    return self;
}

-(id) initWithPointers:(NSArray*)pointers withType:(AILineType)type{
    self = [super init];
    if (self) {
        self.port = [[AIPort alloc] initWithArray:pointers];
        self.type = type;
        self.pointer = [[AIPointer alloc] initWithString:@""];
    }
    return self;
}

@end
