//
//  PersonCell.m
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "PersonCell.h"

@interface PersonCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *idLab;

@property (strong,nonatomic) NSString *nameStr;
@property (strong,nonatomic) NSString *idStr;

@end

@implementation PersonCell

+ (NSString*)reuseIdentifier {
    return @"PersonCell";
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

-(void) initView{
    [self.nameLab setText:@""];
    [self.idLab setText:@""];
}

-(void) setData:(NSString*)nameStr idStr:(NSString*)idStr{
    self.nameStr = nameStr;
    self.idStr = idStr;
    [self refreshDisplay];
}

-(void) refreshDisplay{
    [self.nameLab setText:STRTOOK(self.nameStr)];
    [self.idLab setText:STRTOOK(self.idStr)];
}

+ (CGFloat) getCellHeight{
    return 50;
}

@end
