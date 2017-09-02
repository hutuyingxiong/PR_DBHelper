//
//  Utils.m
//  PersonRelation
//
//  Created by 贾  on 2017/8/31.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "Utils.h"
#import "PersonStore.h"

@implementation Utils

+(NSString*) systemNowTimeFormateBy_YYYYMMDDHHMMSSSSS{
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
    NSString *date =  [formatter stringFromDate:[NSDate date]];
    NSString *timeLocal = [[NSString alloc] initWithFormat:@"%@", date];
    return timeLocal;
}

/**
 *  MARK:--------------------起名字--------------------
 */
+(NSString*) createName{
    NSMutableString *mStr = [[NSMutableString alloc] init];
    //1,姓
    NSArray *surnames = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"冯",@"陈",@"褚",@"卫",@"蒋",@"沈",@"韩",@"杨",@"朱",
                          @"秦",@"尤",@"许",@"何",@"吕",@"施",@"张",@"孔",@"曹",@"严",@"华",@"金",@"魏",@"陶",@"姜",@"戚",@"谢",
                          @"邹",@"喻",@"柏",@"水",@"窦",@"章",@"云",@"苏",@"潘",@"葛",@"奚",@"范",@"彭",@"郎",@"鲁",@"韦",@"昌",
                          @"马",@"苗",@"凤",@"花",@"方",@"俞",@"任",@"袁",@"柳",@"酆",@"鲍",@"史",@"唐",@"费",@"廉",@"岑",@"薛",
                          @"雷",@"贺",@"倪",@"汤",@"滕",@"殷",@"罗",@"毕",@"郝",@"邬",@"安",@"常",@"乐",@"于",@"时",@"傅",@"皮",
                          @"卞",@"齐",@"康",@"伍",@"余",@"元",@"卜",@"顾",@"孟",@"平",@"黄",@"和",@"穆",@"萧",@"尹",@"姚",@"邵",
                          @"湛",@"汪",@"祁",@"毛",@"禹",@"狄",@"米",@"贝",@"明",@"臧",@"计",@"伏",@"成",@"戴",@"谈",@"宋",@"茅",
                          @"庞",@"熊",@"纪",@"舒",@"屈",@"项",@"祝",@"董",@"梁",@"杜",@"阮",@"蓝",@"闵",@"席",@"季",@"麻",@"强",
                          @"贾",@"路",@"娄",@"危",@"江",@"童",@"颜",@"郭",@"梅",@"盛",@"林",@"刁",@"钟",@"徐",@"邱",@"骆",@"高",
                          @"夏",@"蔡",@"田",@"樊",@"胡",@"凌",@"霍",@"虞",@"万",@"支",@"柯",@"昝",@"管",@"卢",@"莫",@"经",@"房",
                          @"裘",@"缪",@"干",@"解",@"应",@"宗",@"丁",@"宣",@"贲",@"邓",@"郁",@"单",@"杭",@"洪",@"包",@"诸",@"左",
                          @"石",@"崔",@"吉",@"钮",@"龚",@"程",@"嵇",@"邢",@"滑",@"裴",@"陆",@"荣",@"翁",@"荀",@"羊",@"於",@"惠",
                          @"甄",@"麴",@"家",@"封",@"芮",@"羿",@"储",@"靳",@"汲",@"邴",@"糜",@"松",@"井",@"段",@"富",@"巫",@"乌",
                          @"焦",@"巴",@"弓",@"牧",@"隗",@"山",@"谷",@"车",@"侯",@"宓",@"蓬",@"全",@"郗",@"班",@"仰",@"秋",@"仲",
                          @"伊",@"宫",@"宁",@"仇",@"栾",@"暴",@"甘",@"钭",@"厉",@"戎",@"祖",@"武",@"符",@"刘",@"景",@"詹",@"束",
                          @"龙",@"叶",@"幸",@"司",@"韶",@"郜",@"黎",@"蓟",@"薄",@"印",@"宿",@"白",@"怀",@"蒲",@"邰",@"从",@"鄂",
                          @"索",@"咸",@"籍",@"赖",@"卓",@"蔺",@"屠",@"蒙",@"池",@"乔",@"阴",@"郁",@"胥",@"能",@"苍",@"双",@"闻",
                          @"莘",@"党",@"翟",@"谭",@"贡",@"劳",@"逄",@"姬",@"申",@"扶",@"堵",@"冉",@"宰",@"郦",@"雍",@"舄",@"璩",
                          @"桑",@"桂",@"濮",@"牛",@"寿",@"通",@"边",@"扈",@"燕",@"冀",@"郏",@"浦",@"尚",@"农",@"温",@"别",@"庄",
                          @"晏",@"柴",@"瞿",@"阎",@"充",@"慕",@"连",@"茹",@"习",@"宦",@"艾",@"鱼",@"容",@"向",@"古",@"易",@"慎",
                          @"戈",@"廖",@"庾",@"终",@"暨",@"居",@"衡",@"步",@"都",@"耿",@"满",@"弘",@"匡",@"国",@"文",@"寇",@"广",
                          @"禄",@"阙",@"东",@"殴",@"殳",@"沃",@"利",@"蔚",@"越",@"夔",@"隆",@"师",@"巩",@"厍",@"聂",@"晁",@"勾",
                          @"敖",@"融",@"冷",@"訾",@"辛",@"阚",@"那",@"简",@"饶",@"空",@"曾",@"毋",@"沙",@"乜",@"养",@"鞠",@"须",
                          @"丰",@"巢",@"关",@"蒯",@"相",@"查",@"後",@"荆",@"红"];
    NSString *surname = surnames[(random() % surnames.count)];
    [mStr appendString:surname];
    
    //2,第2字
    NSArray *words = @[@"沈",@"社",@"舍",@"炊",@"采",@"长",@"青",@"幸",@"亟",@"徇",@"佳",@"舍",@"儿",@"争",@"其",@"刷",@"券",@"制",@"效",@"卷",@"姐",@"姒",@"姗",@"季",@"炙",@"宗",@"届",@"岫",@"征",@"承",@"昔",@"析",@"枕",@"状",@"八",@"并",@"佩",@"函",@"和",@"命",@"坡",@"坪",@"奉",@"孟",@"帛",@"水",@"府",@"佛",@"彼",@"忽",@"或",@"戽",@"房",@"扮",@"枇",@"扶",@"放",@"昏",@"朋",@"服",@"明",@"杭",@"杯",@"枚",@"板",@"沛",@"沐",@"汾",@"版",@"牧",@"虎",@"门",@"阜",@"杷",@"盲",@"非。  冠",@"奎",@"皈",@"客",@"故",@"柑",@"柯",@"况",@"看",@"科",@"肝",@"革",@"屋",@"癸",@"砍",@"禹",@"轨",@"页",@"九",@"亭",@"亮",@"柱",@"俊",@"侣",@"冒",@"段",@"劲",@"南",@"姬",@"姜",@"姣",@"宦",@"帝",@"度",@"痔",@"建",@"峙",@"待",@"律",@"怠",@"急",@"招",@"拒",@"拓",@"拙",@"拉",@"昭",@"架",@"柱",@"柳",@"注",@"治",@"炭",@"界",@"皆",@"突",@"纪",@"纣",@"耐",@"肚",@"致",@"计",@"订",@"军",@"酊",@"俐",@"胃",@"百",@"厘",@"咨",@"姝",@"姿",@"柁",@"沱",@"炭",@"妆",@"纣",@"重",@"珏",@"盅",@"眈",@"俄",@"俞",@"勇",@"威",@"娃",@"姻",@"姚",@"姨",@"屋",@"幽",@"彦",@"奕",@"哀",@"哇",@"玟",@"怡",@"押",@"映",@"昱",@"韦",@"油",@"泳",@"沿",@"姚",@"畏",@"烟",@"盈",@"禹",@"约",@"耶",@"衍",@"要",@"页",@"音",@"昱",@"易",@"柚",@"胤",@"易",@"信",@"侠",@"系",@"俗",@"促",@"俏",@"前",@"则",@"奏",@"型",@"姹",@"妊",@"姝",@"姿",@"室",@"宣",@"巷",@"咱",@"哉",@"思",@"性",@"施",@"昨",@"是",@"春",@"星",@"查",@"柴",@"栅",@"柔",@"染",@"泉",@"帅",@"甚",@"相",@"省",@"砂",@"祈",@"秋",@"穿",@"肖",@"重",@"首",@"酉",@"食",@"香",@"侵",@"俟",@"峙",@"旭",@"注",@"沐",@"炷",@"祉",@"贞",@"昌",@"泓",@"侯",@"保",@"便",@"冒",@"勉",@"匍",@"奔",@"品",@"佩",@"杯",@"封",@"哈",@"皇",@"拔",@"抱",@"怕",@"柏",@"柄",@"泌",@"法",@"泡",@"炳",@"玫",@"盆",@"眉",@"红",@"美",@"虹",@"秒",@"表",@"负",@"面",@"风",@"飞",@"眄",@"胃",@"勃",@"厚",@"咸",@"叛",@"孩",@"奂",@"屏",@"枰",@"某",@"河",@"泛",@"赴。  库",@"恭",@"拱",@"格",@"桂",@"根",@"耕",@"耿",@"股",@"肯",@"贡",@"高",@"个",@"刚",@"哥",@"宫",@"径",@"挂",@"皋",@"径",@"徒",@"倜",@"恬",@"拯",@"指",@"拿",@"料",@"旅",@"晋",@"朕",@"桌",@"桔",@"桃",@"桐",@"洞",@"流",@"洛",@"酒",@"烈",@"特",@"玲",@"珍",@"真",@"矩",@"祝",@"秩",@"租",@"站",@"级",@"纸",@"纳",@"纽",@"者",@"肩",@"芝",@"记",@"讨",@"酌",@"酒",@"针",@"钉",@"只",@"挑",@"借",@"倒",@"值",@"俱",@"倪",@"倘",@"伦",@"兼",@"唐",@"哲",@"娘",@"旃",@"娟",@"娜",@"展",@"峻",@"准",@"凌",@"洲",@"套",@"爹",@"特",@"留",@"俩",@"倜",@"庭",@"恫",@"耻",@"烙",@"料",@"栗",@"株",@"津",@"玳",@"畜",@"砧",@"恩",@"按",@"案",@"鸟",@"洋",@"秧",@"翁",@"纹",@"耘",@"育",@"芽",@"芸",@"蚊",@"袁",@"烟",@"倚",@"原",@"员",@"埃",@"宴",@"峨",@"倚",@"娱",@"容",@"峪",@"晏",@"移",@"益",@"差",@"师",@"席",@"座",@"徐",@"恰",@"息",@"恕",@"肩",@"持",@"拳",@"拾",@"时",@"书",@"曹",@"校",@"朔",@"桑",@"栽",@"殊",@"气",@"洽",@"珊",@"祠",@"神",@"祖",@"秦",@"秤",@"索",@"素",@"纱",@"纾",@"纯",@"虔",@"讫",@"训",@"财",@"起",@"轩",@"芩",@"闪",@"迅",@"倩",@"幸",@"修",@"仓",@"城",@"夏",@"孙",@"宰",@"容",@"射",@"峡",@"厝",@"叟",@"奚",@"畜",@"春",@"乘",@"借",@"准",@"淞",@"宵",@"指",@"拭",@"牲",@"洵",@"洳",@"狩",@"兹",@"珊",@"炸",@"租",@"站",@"宸",@"挈",@"旁",@"晃",@"桓",@"活",@"洪",@"畔",@"亩",@"眠",@"破",@"炮",@"秘",@"粉",@"纺",@"肺",@"肥",@"航",@"般",@"芳",@"芙",@"花",@"配",@"马",@"侯",@"倍",@"俯",@"俸",@"们",@"圃",@"埋",@"娩",@"峰",@"肪",@"涵",@"畔",@"埔",@"害",@"恢",@"恍",@"恒",@"柏",@"派",@"洹",@"玻",@"泌",@"珉",@"祜",@"呗。  国",@"寇",@"昆",@"康",@"苦",@"袍",@"规",@"贯",@"够",@"勘",@"崞",@"岗",@"梗",@"珙",@"偕",@"假",@"健",@"停",@"侦",@"剪",@"动",@"翎",@"念",@"基",@"坚",@"堂",@"堆",@"婧",@"寄",@"专",@"张",@"得",@"教",@"救",@"朗",@"条",@"梁",@"梯",@"械",@"梨",@"浙",@"浪",@"珠",@"略",@"皎",@"眷",@"窕",@"竟",@"第",@"终",@"累",@"舵",@"苓",@"架",@"诀",@"近",@"钓",@"顶",@"鸟",@"将",@"那",@"庶",@"振",@"挺",@"捉",@"捐",@"甜",@"祭",@"趾",@"囵",@"堆",@"凌",@"崃",@"带",@"帐",@"徕",@"悌",@"画",@"梁",@"梃",@"桶",@"町",@"娄",@"伟",@"偶",@"务",@"唯",@"问",@"婉",@"寅",@"尉",@"帷",@"庸",@"悟",@"悠",@"悦",@"敖",@"晚",@"梧",@"浴",@"眼",@"研",@"移",@"胃",@"苑",@"英",@"迎",@"野",@"鱼",@"欲",@"浣",@"翌",@"圉",@"乾",@"做",@"区",@"卿",@"参",@"售",@"启",@"商",@"唱",@"娶",@"妇",@"宿",@"崇",@"崎",@"崔",@"常",@"强",@"从",@"悄",@"叙",@"旋",@"晨",@"晟",@"族",@"消",@"爽",@"犀",@"祥",@"绅",@"细",@"紫",@"组",@"绍",@"婧",@"羞",@"习",@"邢",@"舷",@"船",@"茄",@"若",@"处",@"术",@"袖",@"设",@"讼",@"责",@"赦",@"雀",@"雪",@"顷",@"彩",@"常",@"孰",@"侦",@"匙",@"圊",@"执",@"将",@"专",@"就",@"峥",@"崧",@"巢",@"庶",@"彩",@"悉",@"施",@"曹",@"浙",@"笙",@"钏",@"阡",@"凰",@"毫",@"培",@"婚",@"婆",@"妇",@"密",@"彬",@"彪",@"患",@"斌",@"曼",@"海",@"浩",@"烽",@"班",@"瓶",@"毕",@"盒",@"符",@"邦",@"胡",@"背",@"胞",@"胖",@"舶",@"范",@"茅",@"苗",@"袍",@"被",@"觅",@"访",@"货",@"返",@"贩",@"闭",@"麦",@"麻",@"邦",@"壶",@"票",@"冕",@"副",@"埠",@"屏",@"涵",@"捕",@"敏",@"皓",@"梅",@"第",@"珩",@"艴",@"苹。   敢",@"款",@"淦",@"筐",@"给",@"贵",@"辜",@"开",@"凯",@"昆",@"诒",@"询",@"几",@"蛟",@"植",@"堵",@"堤",@"奠",@"岚",@"帧",@"掌",@"掘",@"捷",@"掏",@"掎推",@"探",@"接",@"敦",@"景",@"智",@"晶",@"替",@"朝",@"椒",@"棠",@"栈",@"殖",@"淘",@"添",@"淡",@"净",@"焦",@"街",@"诊",@"理",@"荔",@"眨",@"贴",@"屠",@"贷",@"轸",@"迢",@"迪",@"迦",@"量",@"钧",@"钮",@"间",@"集",@"杰",@"劳",@"单",@"婷",@"喋",@"传",@"塘",@"塔",@"暖",@"楠",@"殿",@"渡",@"汤",@"帏",@"幄",@"惟",@"掩",@"椅",@"涯",@"液",@"渊",@"焰",@"为",@"异",@"砚",@"围茵",@"越",@"阮",@"轶",@"雁",@"雅",@"寓",@"云",@"雯",@"媛",@"喻",@"贻",@"婺",@"焱",@"琬",@"琰",@"畲",@"劳",@"博",@"堡",@"报",@"富",@"寒",@"嵋",@"帽",@"幅",@"帮",@"弼",@"复",@"彭徨",@"偏",@"整",@"理",@"惠",@"扉",@"排",@"斑",@"酣",@"普",@"棉",@"棒",@"棚",@"涵",@"混",@"淼",@"淮",@"淝",@"牌",@"画",@"番",@"发",@"皓",@"脉",@"茗",@"评",@"贺",@"费",@"买",@"贸",@"迫",@"邯",@"闵",@"防",@"阪",@"黄",@"傅",@"傍",@"媒",@"媚",@"黑",@"瓿   匮",@"块",@"干",@"感",@"揆",@"手",@"楷",@"港",@"琨",@"莞",@"夸",@"鼓",@"该",@"贾",@"传",@"仅",@"涂",@"塔",@"塘",@"廊",@"谦",@"提",@"敬",@"斟",@"极",@"楠",@"殿汤",@"渡",@"绢",@"经",@"茎",@"莒",@"获",@"莅",@"庄",@"莉",@"蜀",@"里",@"装",@"解",@"詹",@"鼎",@"贾",@"路",@"迹",@"退",@"铃",@"钜",@"陀",@"电",@"雷",@"靖",@"顿",@"暖",@"桢",@"路",@"嫁",@"农",@"贮",@"贷",@"贴",@"轸",@"迪",@"钠",@"湍",@"琳",@"当",@"略",@"铃",@"鼓",@"励",@"庸",@"园",@"圆",@"奥",@"爱",@"意",@"扬",@"援",@"握",@"榆",@"业",@"杨",@"椰涌",@"渝",@"渭",@"游",@"炜",@"爷",@"烟",@"兽",@"犹",@"煜",@"碗",@"筠",@"义",@"肄",@"莞",@"莠",@"虞",@"蛾",@"裕",@"诣",@"郁",@"钰",@"雍",@"阿",@"预",@"饮",@"衙",@"莹",@"蓊",@"晕",@"渥",@"琬",@"琰",@"畹",@"筵",@"裔",@"淡",@"催",@"传",@"勤",@"势",@"嗣",@"塞",@"嵩",@"厦",@"新",@"喧",@"楸",@"楚",@"岁湘",@"测",@"凑",@"煦",@"琴",@"琪",@"琦",@"睡",@"祺",@"稔",@"稠",@"筮",@"粲",@"绣",@"群",@"圣",@"莎",@"裙",@"诩",@"诗",@"试",@"诠",@"详",@"资",@"载",@"送",@"铅",@"阻",@"雌",@"颂",@"驰",@"熙",@"暄",@"琼",@"塞",@"嵩",@"想",@"桢",@"椿",@"岁",@"渚",@"煮",@"琛",@"庄",@"裟",@"输",@"轼",@"幕",@"汇",@"惶",@"挥",@"描",@"换",@"楣",@"枫",@"湖",@"浑",@"渺",@"涣",@"煤烦",@"琶",@"琥",@"盟",@"睦",@"碑",@"禀",@"聘",@"腑",@"荷",@"莫",@"号",@"蜂",@"补",@"话",@"酩",@"附",@"颁",@"饭",@"晕",@"募",@"焕   廓",@"愧",@"沟",@"管",@"纲",@"诰",@"闺",@"魁",@"构",@"歌",@"恺",@"斡",@"荣构",@"嘏",@"通",@"连",@"这",@"甄",@"兢",@"喜",@"团",@"图",@"奖",@"嫡",@"对",@"僚",@"侥屡",@"嶂",@"崭",@"彰",@"廖",@"熊",@"溜",@"监",@"祯",@"种",@"端",@"箕",@"筝",@"精",@"绿",@"紧",@"绫",@"纶",@"置",@"璋",@"畅",@"榔",@"糍",@"滇",@"尔",@"莱",@"赵",@"铬",@"领",@"瑙",@"奁",@"闻",@"嫣",@"愿",@"温",@"源",@"溢",@"尔",@"瑜",@"瑛",@"瑗",@"玮",@"与舞",@"苑",@"诱",@"语",@"郢",@"银",@"摇",@"榕",@"荣",@"温",@"荥",@"溶",@"菸",@"菀",@"鞅",@"瑛",@"僖",@"逑",@"速",@"逍",@"肾",@"寿",@"塾",@"尘",@"嫩",@"实",@"像",@"侨",@"岖",@"慈滋",@"沧",@"溶",@"溪",@"熊",@"狮",@"瑞",@"瑟",@"硕",@"算",@"粹",@"绸",@"综",@"绰",@"绮",@"翠",@"菁",@"菜",@"菖",@"裳",@"认",@"誓",@"诵",@"说",@"诚",@"轻",@"菘",@"造",@"速",@"衔",@"铨",@"限",@"需",@"韶",@"饲",@"饰",@"旗",@"畅",@"荣",@"榕",@"齐",@"熏",@"僦",@"尝",@"墅",@"奖",@"实",@"寨",@"慎",@"准",@"溯",@"搴",@"逢",@"梦",@"仆",@"幕",@"滑",@"瑚",@"珲",@"碧",@"福",@"绵",@"翡",@"腑",@"萍华",@"菩",@"蜜",@"裴",@"豪",@"宾",@"辅",@"郝",@"铭",@"阀",@"陌",@"颇",@"饮",@"凤",@"鸣",@"榜",@"槐",@"滏  宽",@"广",@"慷",@"惯",@"概",@"瑰",@"葛",@"葵",@"课",@"逵",@"郭",@"稿",@"靠溉",@"锆",@"俭",@"著",@"价",@"厉",@"剧",@"剑",@"刘",@"妖",@"履",@"帜",@"弹",@"徵",@"德虑",@"摘",@"敌",@"整",@"暂",@"椿",@"闾",@"乐",@"楼",@"樟",@"滴",@"渐",@"涨",@"浆",@"练",@"缔",@"蒂",@"骀",@"落",@"董",@"葶",@"蝶",@"调",@"谆",@"谈",@"诋",@"诤",@"谅",@"论",@"质",@"驼",@"践",@"轮",@"逮",@"进",@"醇",@"铝",@"阵",@"震",@"霆",@"驾",@"驻",@"稽",@"稻",@"稷",@"节",@"剪",@"几",@"鲁",@"黎",@"侬",@"涤",@"墩",@"幢",@"嶙",@"锻",@"褚",@"亿",@"仪",@"影",@"慰",@"忧",@"乐",@"样",@"欧",@"毅",@"演",@"渔",@"熬",@"熠熨",@"瑶",@"缘",@"纬",@"腰",@"万",@"莹",@"叶",@"苇",@"谊",@"逸",@"邮",@"阅",@"院",@"鞍",@"颐",@"养",@"欲",@"颍",@"粗",@"缓",@"卫",@"葳",@"骑",@"妩",@"鉴",@"署",@"啸",@"增",@"婵",@"审",@"层",@"厂",@"厨",@"厮",@"庆",@"摧",@"数",@"枢漆",@"熟",@"热",@"线",@"肠",@"兴",@"萱",@"冲",@"褚",@"谁",@"请",@"贤",@"赏",@"赐",@"趣",@"娴",@"醉",@"锐",@"销",@"爽",@"霄",@"驷",@"确",@"磁",@"穷",@"箭",@"箱",@"竖",@"辍",@"帜",@"漩",@"渐",@"箴",@"节",@"绪",@"翦",@"葸",@"诤",@"谆",@"质",@"醇",@"罚",@"划",@"哗",@"坟",@"墨",@"币",@"庙",@"废",@"慧",@"慕",@"慢",@"暮",@"樊标",@"模",@"流",@"浒",@"汉",@"满",@"漫",@"漂",@"玛",@"缓",@"编",@"腹",@"铺",@"葆",@"葡",@"复",@"卖",@"赋",@"辉",@"辈",@"部",@"锋",@"陛",@"盘",@"码",@"篇",@"范",@"麾",@"劈",@"幡",@"慧",@"摩",@"沪",@"漠",@"磐",@"褒",@"弼",@"荭   窥",@"糕",@"膏",@"盖",@"钢",@"龟",@"购",@"器",@"垦",@"横",@"橄",@"篙",@"馆尽",@"坛",@"导",@"惮",@"战",@"撰",@"整",@"历",@"瞳",@"昙",@"暨",@"机",@"橘",@"洁",@"潭",@"灯",@"瑾",@"璋",@"庐",@"积",@"筑",@"蒸",@"诸",@"",@"谛",@"诺",@"练",@"猪",@"赖",@"蹄",@"辑",@"道",@"达",@"都",@"录",@"锦",@"锭",@"陆",@"陶",@"陵",@"霓",@"霖",@"静",@"颊",@"头",@"雕",@"疆",@"腿",@"臻",@"赚",@"骆",@"莅",@"俦",@"橙",@"润",@"澈",@"笃",@"缙",@"萤   萤",@"卫",@"谓",@"谒",@"谙",@"谕",@"豫",@"逾",@"游",@"运",@"阴",@"余",@"壅赢",@"蓉",@"蓊",@"勋",@"儒",@"器",@"学",@"宪",@"熹",@"憧",@"晓",@"桥",@"樵",@"橙",@"橡",@"树润",@"潮",@"甑",@"莳",@"璇",@"聪",@"融",@"亲",@"谌",@"谐",@"输",@"遂",@"醒"];
    [mStr appendString:words[(random() % words.count)]];
    
    //3,第3字
    if (random() % 2 > 0) {
        [mStr appendString:words[(random() % words.count)]];
    }
    return mStr;
}


+(NSString*) getIdStrWithIdValue:(NSInteger)idValue {
    NSString *idStr = @"0000000000000";
    NSString *lastIdStr = STRFORMAT(@"%ld",(long)idValue);
    return [idStr stringByReplacingCharactersInRange:NSMakeRange(idStr.length - lastIdStr.length, lastIdStr.length) withString:lastIdStr];
}

+(NSString*) getAILineIdStrWithIdValue:(NSInteger)idValue {
    NSString *idStr = @"L0000000000000";
    NSString *lastIdStr = STRFORMAT(@"%ld",(long)idValue);
    return [idStr stringByReplacingCharactersInRange:NSMakeRange(idStr.length - lastIdStr.length, lastIdStr.length) withString:lastIdStr];
}



/**
 *  MARK:--------------------区域点亮--------------------
 */
+(NSMutableArray*) areaLight:(AIDictionary*)dic energy:(NSInteger)energy invalidDics:(NSArray*)invalidDics{
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    //1,检查中心数据
    if (ISOK(dic , AIDictionary.class) && ISOK(dic.port, AIPort.class)) {
        //2,遍历中心数据的网口
        for (AIPointer *linePointer in dic.port.pointers) {
            if (POINTERISOK(linePointer)) {
                //3,找到网口的网线
                AIObject *lineObj = [PersonStore getPerson_KVPathWithPointer:linePointer];
                if (LINEISOK(lineObj)) {
                    AILine *line = (AILine*)lineObj;
                    //4,遍历网线的网口
                    if (LINEISOK(line) && ISOK(line.port, AIPort.class)) {
                        for (AIPointer *relationPointer in ARRTOOK(line.port.pointers)) {
                            //5,去无效
                            BOOL valid = true;
                            for (AIDictionary *invalidDic in invalidDics) {
                                if (ISOK(invalidDic, AIDictionary.class)) {
                                    if ([relationPointer isEqual:invalidDic.pointer]) {
                                        valid = false;
                                    }
                                }
                            }
                            //6,找到关联网口指向数据
                            if (valid) {
                                AIObject *relationObj = [PersonStore getPerson_KVPathWithPointer:relationPointer];
                                if (ISOK(relationObj, AIDictionary.class)) {
                                    [mArr addObject:relationObj];
                                    //7,耗尽energy则返回;
                                    if (mArr.count >= energy) {
                                        return mArr;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return mArr;
}



@end
