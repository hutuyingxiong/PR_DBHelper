//
//  AIDictionary.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIDictionary.h"

@interface AIDictionary ()

@property (strong,nonatomic) NSMutableDictionary *dic;

@end

@implementation AIDictionary

-(id) initWithDictionary:(NSDictionary *)otherDic withPointer:(AIPointer*)pointer{
    self = [super init];
    if (self) {
        [self.dic setDictionary:DICTOOK(otherDic)];
        self.pointer = pointer;
    }
    return self;
}

-(NSMutableDictionary *)dic{
    if (_dic == nil) {
        _dic = [[NSMutableDictionary alloc] init];
    }
    return _dic;
}

- (id)objectForKey:(NSString *)key{
    return [self.dic objectForKey:key];
}

/**
 *  MARK:--------------------NSCoding--------------------
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.dic = [aDecoder decodeObjectForKey:@"dic"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.dic forKey:@"dic"];
}


@end
