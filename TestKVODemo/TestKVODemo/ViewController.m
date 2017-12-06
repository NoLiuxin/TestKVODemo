//
//  ViewController.m
//  TestKVODemo
//
//  Created by 刘新 on 2017/12/6.
//  Copyright © 2017年 Liuxin. All rights reserved.
//

#import "ViewController.h"
#import "LabColor.h"
static NSString * ColorKVOContext = @"ColorKVOContext";
@interface ViewController ()
@property (nonatomic, strong) LabColor *labColor;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.labColor = [[LabColor alloc] init];
    //添加监听
    /*
     *self.labColor 观察的对象
     *self 观察者
     *@"color" 观察路径
     *NSKeyValueObservingOptionInitial 观察方式
     *context 上下文
     */
    [self.labColor addObserver:self forKeyPath:@"color" options:NSKeyValueObservingOptionInitial context:&ColorKVOContext];
}
//响应观察
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context==&ColorKVOContext) {
        self.colorView.backgroundColor = self.labColor.color;
    }
}
- (IBAction)updateRedSlider:(UISlider *)sender {
    self.labColor.lComponent = sender.value;
}
- (IBAction)updateGreenSlider:(UISlider *)sender {
    self.labColor.aComponent = sender.value;
}
- (IBAction)updateBlueSlider:(UISlider *)sender {
    self.labColor.bComponent = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    //在对象被释放时移除观察者，否则会出现BUG
    [self.labColor removeObserver:self forKeyPath:@"color"];
}

@end
