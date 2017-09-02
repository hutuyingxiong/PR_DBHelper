//
//  AIObject.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIObject.h"

@implementation AIObject

-(AIPort *)port{
    if (_port == nil) {
        _port = [[AIPort alloc] init];
    }
    return _port;
}



/**
 *  MARK:--------------------插网线--------------------
 *  每次产生神经网络的时候,要把网线插在网口上;
 */
-(void) connectLine:(AILine*)line save:(BOOL)save{
    BOOL success = [self.port connectLine:line];
    if (success && save) {
        [AIStore store_Insert:self];//插网线成功,保存AIObject
    }
}


/**
 *  MARK:--------------------NSCoding--------------------
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.pointer = [aDecoder decodeObjectForKey:@"pointer"];
        self.port = [aDecoder decodeObjectForKey:@"port"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.pointer forKey:@"pointer"];
    [aCoder encodeObject:self.port forKey:@"port"];
}




@end
