//
//  LogWindow.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "LogWindow.h"
#import "PersonStore.h"

@interface LogWindow() <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *datas;

@end

@implementation LogWindow

-(id) init{
    self = [super init];
    if (self) {
        [self initView];
        [self initData];
        [self initDisplay];
    }
    return self;
}

-(void) initView{
    [[NSBundle mainBundle] loadNibNamed:@"LogWindow" owner:self options:nil];
    [self.containerView setFrame:CGRectMake(0, 0, 200, 200)];
    [self setFrame:CGRectMake(0, ScreenHeight - 200, 200, 200)];
    [self setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.containerView];
    
}

-(void) initData{
    self.datas = [[NSMutableArray alloc] init];
}

-(void) initDisplay{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

/**
 *  MARK:--------------------method--------------------
 */
-(void) open {
    [self setHidden:false];
}

-(void) close {
    [self setHidden:true];
}

-(void) appendLog:(NSString*)log{
    [self.datas addObject:STRTOOK(log)];
    [self.tableView reloadData];
}

/**
 *  MARK:--------------------UITableViewDelegate,UITableViewDataSource--------------------
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.datas.count) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        [cell.textLabel setFont:[UIFont systemFontOfSize:10 weight:10]];
        [cell.textLabel setText:STRTOOK(self.datas[indexPath.row])];
        return cell;
    }
    return [[UITableViewCell alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click");
}

/**
 *  MARK:--------------------onclick--------------------
 */
- (IBAction)closeBtnOnClick:(id)sender {
    [self close];
}




@end
