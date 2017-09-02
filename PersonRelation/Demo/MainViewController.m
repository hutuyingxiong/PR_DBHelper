//
//  MainViewController.m
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "MainViewController.h"
#import "PersonCell.h"
#import "PersonStore.h"
#import "ControlWindow.h"
#import "LogWindow.h"

@interface MainViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,ControlWindowDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputTF;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) ControlWindow *controlWindow;
@property (strong,nonatomic) LogWindow *logWindow;
@property (weak, nonatomic) IBOutlet UIButton *controlWindowBtn;
@property (strong,nonatomic) NSMutableArray *datas;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
    [self initDisplay];
}

-(void) initView {
    //self
    [self.navigationController setNavigationBarHidden:true];
    
    //registerNib
    UINib *nib = [UINib nibWithNibName:[PersonCell reuseIdentifier] bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:[PersonCell reuseIdentifier]];
    
    //controlWindow
    self.controlWindow = [[ControlWindow alloc] init];
    self.controlWindow.delegate = self;
    self.controlWindow.frame = CGRectMake(16, 140, ScreenWidth - 32, 300);
    [self.view addSubview:self.controlWindow];
    [self.controlWindow close];
    
    //logWindow
    self.logWindow = [[LogWindow alloc] init];
    [self.view addSubview:self.logWindow];
    [self.logWindow close];
    
    //inputTF
    [self.inputTF setDelegate:self];
}

-(void) initData {
    self.datas = [[NSMutableArray alloc] init];
}

-(void) initDisplay {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

/**
 *  MARK:--------------------onclick--------------------
 */
- (IBAction)contorlWindowBtnOnClick:(id)sender {
    [self.controlWindow open];
}

- (IBAction)logWindowBtnOnClick:(id)sender {
    [self.logWindow open];
}

/**
 *  MARK:--------------------UITextFieldDelegate--------------------
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //1,取idValue
    NSString *toBeStr = textField.text;
    if (range.location != NSNotFound && range.location + range.length <= textField.text.length && STRISOK(string)) {
        toBeStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }
    
    NSInteger idValue = [STRTOOK(toBeStr) integerValue];
    
    //2,取目标
    AIObject *centerObj = [PersonStore getPerson_KVPathWithValue:idValue];
    
    //3,收集数据
    [self.datas removeAllObjects];
    NSInteger maxCount = self.controlWindow.getSelectMaxNum;
    
    double lastTime = [[NSDate date] timeIntervalSince1970];//Log1
    if (ISOK(centerObj, AIDictionary.class)) {
        AIDictionary *centerDic = (AIDictionary*)centerObj;
        //3.1,一阶
        [self.datas addObject:centerDic];
        //3.2,二阶
        NSMutableArray *twoDatas = [Utils areaLight:centerDic energy:maxCount - self.datas.count invalidDics:self.datas];
        [self.datas addObjectsFromArray:twoDatas];
        //3.3,三阶
        for (AIDictionary *twoItem in ARRTOOK(twoDatas)) {
            NSInteger energy = maxCount - self.datas.count;
            if (energy > 0) {
                NSMutableArray *threeDatas = [Utils areaLight:twoItem energy:energy invalidDics:self.datas];
                [self.datas addObjectsFromArray:threeDatas];
            }
        }
    }
    [self.logWindow appendLog:STRFORMAT(@"read___%f",[[NSDate date] timeIntervalSince1970] - lastTime)];//Log2
    
    //4,刷新UI
    [self.tableView reloadData];
    
    return YES;
}

/**
 *  MARK:--------------------UITableViewDelegate,UITableViewDataSource--------------------
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.datas.count) {
        AIDictionary *dic = self.datas[indexPath.row];
        PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:[PersonCell reuseIdentifier]];
        [cell setData:[dic objectForKey:@"Name"] idStr:[dic objectForKey:@"Id"]];
        return cell;
    }
    return [[UITableViewCell alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [PersonCell getCellHeight];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click");
}

/**
 *  MARK:--------------------ControlWindowDelegate--------------------
 */
-(void)controlWindow_Log:(NSString *)log{
    [self.logWindow appendLog:log];
}

@end
