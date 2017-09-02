//
//  ControlWindow.m
//  PersonRelation
//
//  Created by 贾  on 2017/9/1.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "ControlWindow.h"
#import "PersonStore.h"

@interface ControlWindow()

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *inputTF;
@property (weak, nonatomic) IBOutlet UIButton *createPersonBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *createProgressView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UILabel *relationDensityLab;
@property (weak, nonatomic) IBOutlet UILabel *selectMaxLab;

@end

@implementation ControlWindow

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
    [[NSBundle mainBundle] loadNibNamed:@"ControlWindow" owner:self options:nil];
    [self.containerView setFrame:CGRectMake(0, 0, ScreenWidth - 32, 300)];
    [self setFrame:CGRectMake(0, 0, ScreenWidth - 32, 300)];
    [self setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.containerView];
    
}

-(void) initData{
    
}

-(void) initDisplay{
    
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

-(NSInteger) getRelationDensityNum{
    return MAX(0, [STRTOOK(self.relationDensityLab.text) integerValue]);
}

-(NSInteger) getSelectMaxNum{
    return MAX(0, [STRTOOK(self.selectMaxLab.text) integerValue]);
}


/**
 *  MARK:--------------------onclick--------------------
 */
- (IBAction)createPersonBtnOnClick:(id)sender {
    NSInteger count = [STRTOOK(self.inputTF.text) integerValue];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        double lastTime = [[NSDate date] timeIntervalSince1970];//Log1
        
        [PersonStore createOriPerson_KVPath:count relationDensityNum:self.getRelationDensityNum singleComplete:^(CGFloat progress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (progress == 1) {
                    [self.createProgressView setProgress:0];
                }else{
                    [self.createProgressView setProgress:progress];
                }
            });
        }];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(controlWindow_Log:)]) {
            [self.delegate controlWindow_Log:STRFORMAT(@"write___%f",[[NSDate date] timeIntervalSince1970] - lastTime)];//Log2
        }
    });
}

- (IBAction)clearBtnOnClick:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.clearBtn setTitle:@"Wait" forState:UIControlStateNormal];
            [self.clearBtn setBackgroundColor:[UIColor redColor]];
        });
        
        double lastTime = [[NSDate date] timeIntervalSince1970];//Log1
        
        [PersonStore clear];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(controlWindow_Log:)]) {
            [self.delegate controlWindow_Log:STRFORMAT(@"clear___%f",[[NSDate date] timeIntervalSince1970] - lastTime)];//Log2
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.clearBtn setTitle:@"清空" forState:UIControlStateNormal];
            [self.clearBtn setBackgroundColor:[UIColor yellowColor]];
        });
    });
}

- (IBAction)closeBtnOnClick:(id)sender {
    [self close];
}

- (IBAction)relationDensitySubBtnOnClick:(id)sender {
    NSInteger num = [STRTOOK(self.relationDensityLab.text) integerValue];
    [self.relationDensityLab setText:STRFORMAT(@"%d",MAX(0, num - 1))];
}

- (IBAction)relationDensityAddBtnOnClick:(id)sender {
    NSInteger num = [STRTOOK(self.relationDensityLab.text) integerValue];
    [self.relationDensityLab setText:STRFORMAT(@"%d",MAX(0, num + 1))];
}

- (IBAction)selectSubMaxBtnOnClick:(id)sender {
    NSInteger num = [STRTOOK(self.selectMaxLab.text) integerValue];
    [self.selectMaxLab setText:STRFORMAT(@"%d",MAX(0, num - 1))];
}

- (IBAction)selectAddMaxBtnOnClick:(id)sender {
    NSInteger num = [STRTOOK(self.selectMaxLab.text) integerValue];
    [self.selectMaxLab setText:STRFORMAT(@"%d",MAX(0, num + 1))];
}


@end
