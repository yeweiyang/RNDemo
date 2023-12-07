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
}

// iOS 调研react的页面
- (void)showReactView {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.11.196:8081/index.bundle?platform=ios"];

    NSDictionary *dic =  @{
        @"scores" : @[
          @{
            @"name" : @"zhuzhu",
            @"value": @"1"
           },
          @{
            @"name" : @"muyu",
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


@end
