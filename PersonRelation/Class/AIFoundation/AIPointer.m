//
//  AIPointer.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIPointer.h"

@implementation AIPointer


-(id) initWithString:(NSString*)content{
    self = [super init];
    if (self) {
        _content = STRTOOK(content);
    }
    return self;
}


-(NSString*) filePath{
    if (STRISOK(_content)) {
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSMutableString *fileRootPath = [[NSMutableString alloc] initWithFormat:@"%@/KVPath",cachePath];
        for (NSInteger j = 0; j < self.length - 1; j++) {
            [fileRootPath appendFormat:@"/%@",[_content substringWithRange:NSMakeRange(j, 1)]];
        }
        return fileRootPath;
    }
    return nil;
}

-(NSString*) fileName{
    if (STRISOK(_content)) {
        return [_content substringFromIndex:self.length - 1];
    }
    return nil;
}

-(NSInteger)length{
    if (STRISOK(self.content)) {
        return _content.length;
    }
    return 0;
}

-(BOOL)isEqual:(AIPointer*)object{
    if (POINTERISOK(object)) {
        return [STRTOOK(self.content) isEqualToString:object.content];
    }
    return false;
}

/**
 *  MARK:--------------------NSCoding--------------------
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _content = [aDecoder decodeObjectForKey:@"content"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.content forKey:@"content"];
}

@end
