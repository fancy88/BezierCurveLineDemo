//
//  DetailViewController.m
//  BezierCurveLineDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DetailViewController.h"
#import "BezierCurveView.h"

#define kScreenWidth self.view.frame.size.width

@interface DetailViewController (){
    NSInteger mType;
}

@property (strong,nonatomic)BezierCurveView *bezierView;
@property (strong,nonatomic)NSMutableArray *namesArr;
@property (strong,nonatomic)NSMutableArray *targetsArr;

@end

@implementation DetailViewController

- (instancetype)initWithType: (NSInteger)type{
    self = [super init];
    if (self) {
        mType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getUI];
    // Do any additional setup after loading the view.
}

- (void)getUI{
    
    //1.初始化
    _bezierView = [[BezierCurveView alloc] initWithFrame:CGRectMake(30, 30, kScreenWidth-60, 280)];
    _bezierView.center = self.view.center;
    [self.view addSubview:_bezierView];
    
    switch (mType) {
        case 100:
        {
          self.title = @"折线图";
          [self drawLineChart];
        }
            break;
        case 101:
        {
          self.title = @"柱状图";
          [self drawBaseChart];
        }
            break;
        case 102:
        {
          self.title = @"饼状图";
          [self drawPieChart];
        }
            break;
            
        default:
            break;
    }
}

/**
 *  X轴值
 */
-(NSMutableArray *)namesArr{
    if (!_namesArr) {
        _namesArr = [NSMutableArray arrayWithArray:@[@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"历史",@"地理"]];
    }
    return _namesArr;
}

/**
 *  Y轴值
 */
-(NSMutableArray *)targetsArr{
    if (!_targetsArr) {
        _targetsArr = [NSMutableArray arrayWithArray:@[@20,@40,@20,@50,@30,@90,@30,@100,@70]];
    }
    return _targetsArr;
}

//画折线图
-(void)drawLineChart{
    
    //直线
    //    [_bezierView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets LineType:LineType_Straight];
    
    //曲线
    [_bezierView drawLineChartViewWithX_Value_Names:self.namesArr TargetValues:self.targetsArr LineType:LineType_Curve];
}


//画柱状图
-(void)drawBaseChart{
    [_bezierView drawBarChartViewWithX_Value_Names:self.namesArr TargetValues:self.targetsArr];
}


//画饼状图
-(void)drawPieChart{
    [_bezierView drawPieChartViewWithX_Value_Names:self.namesArr TargetValues:self.targetsArr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
