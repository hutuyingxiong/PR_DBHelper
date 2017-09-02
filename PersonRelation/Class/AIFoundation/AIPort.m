//
//  AIPort.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIPort.h"

@interface AIPort ()

@property (strong,nonatomic) NSMutableArray *pointers;

@end

@implementation AIPort

-(id) initWithArray:(NSArray*)arr{
    self = [super init];
    if (self) {
        [self.pointers addObjectsFromArray:arr];
    }
    return self;
}

-(NSMutableArray *)pointers{
    if (_pointers == nil) {
        _pointers = [[NSMutableArray alloc] init];
    }
    return _pointers;
}


/**
 *  MARK:--------------------NSCoding--------------------
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.pointers = [aDecoder decodeObjectForKey:@"pointers"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.pointers forKey:@"pointers"];
}



/**
 *  MARK:--------------------判断是否插了某网线--------------------
 */
-(BOOL) containsLine:(AILine*)line{
    if (LINEISOK(line)) {
        for (AIPointer *pointer in self.pointers) {
            if (POINTERISOK(pointer)) {
                if ([pointer isEqual:line.pointer]) {
                    return true;
                }
            }
        }
    }
    return false;
}

-(BOOL) connectLine:(AILine*)line{
    if (LINEISOK(line) && POINTERISOK(line.pointer) && ![self containsLine:line]) {
        [self.pointers addObject:line.pointer];
        return true;
    }
    return false;
}

@end
