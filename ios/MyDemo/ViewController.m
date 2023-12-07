//
//  ViewController.m
//  MyDemo
//
//  Created by Qiang Ma on 2023/12/6.
//

#import "ViewController.h"
#import <react/RCTRootView.h>
//#import <JSONModel/JSONModel.h>

//@interface City : JSONModel
//
//@end

@interface ViewController ()
@property (nonatomic, strong) UIButton *playButton; //播放按钮
@property (nonatomic, strong) UIViewController *reactVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 56)];
    [self.playButton setBackgroundColor:[UIColor blueColor]];
    [self.playButton setTitle:@"点击展示reactview" forState:UIControlStateNormal];
    [self.playButton addTarget:self action:@selector(showReactView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton];
    
    [self addNotification];
}

// iOS 调研react的页面
- (void)showReactView {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.101.21:8081/index.bundle?platform=ios"];

    NSDictionary *dic =  @{
        @"scores" : @[
          @{
            @"name" : @"iOS_param1",
            @"value": @"1"
           },
          @{
            @"name" : @"iOS_param2",
            @"value": @"2"
          }
        ]
    };

    RCTRootView *rootView =  [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                                         moduleName: @"RNHighScores"
                                                  initialProperties:dic
                                                      launchOptions: nil];
    self.reactVC = [[UIViewController alloc] init];
    self.reactVC.view = rootView;
    [self presentViewController:self.reactVC animated:YES completion:nil];
//    [self.navigationController pushViewController:self.reactVC animated:YES];
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(calendarNotification:) name:@"calendarNotification" object:nil];
}

// react 调用 iOS的方法
- (void)calendarNotification:(NSNotification *)noti {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.reactVC dismissViewControllerAnimated:YES completion:nil];
        
        NSString *message = [NSString stringWithFormat:@"rn调用oc的弹框, \n内容:%@, %@", noti.object[@"name"], noti.object[@"location"]];
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"交互" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertControl addAction:cancelAction];
        
        [self presentViewController:alertControl animated:YES completion:nil];
    });
}

@end
