//
//  PersonCell.h
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonCell : UITableViewCell

+ (NSString*)reuseIdentifier;
-(void) setData:(NSString*)nameStr idStr:(NSString*)idStr;
+ (CGFloat) getCellHeight;

@end
