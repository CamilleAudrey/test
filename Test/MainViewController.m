//
//  MainViewController.m
//  Test
//
//  Created by imac on 2017/8/8.
//  Copyright © 2017年 Guowu. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UIViewController *currentViewController;

@property (strong, nonatomic) FirstViewController *first;
@property (strong, nonatomic) SecondViewController *second;
@property (strong, nonatomic) ThirdViewController *third;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _first = [[FirstViewController alloc] init];
    _second = [[SecondViewController alloc] init];
    _third = [[ThirdViewController alloc] init];
    
    [self addChildViewController:_first];
    [self addChildViewController:_second];
    [self addChildViewController:_third];
    
    [_contentView addSubview:_third.view];
    _currentViewController = _third;
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)onClickbutton:(UIButton *)sender {

    if ((_currentViewController == _first && sender.tag == 1)||(_currentViewController == _second && sender.tag == 2) ||(_currentViewController == _third && sender.tag == 3)) {
        return;
    }
    UIViewController *oldViewController = _currentViewController;
    switch ([sender tag]) {
        case 1:{
            NSLog(@"第一页");
            [self transitionFromViewController:_currentViewController toViewController:_first duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    _currentViewController = _first;
                }else{
                    _currentViewController = _second;
                }
            }];
            
        } break;
        case 2:{
            NSLog(@"第二页");
            [self transitionFromViewController:_currentViewController toViewController:_second duration:1 options:UIViewAnimationOptionTransitionCurlDown animations:^{
                
            }  completion:^(BOOL finished) {
                if (finished) {
                    _currentViewController = _second;
                }else{
                    _currentViewController = oldViewController;
                }
            }];
        } break;
        case 3:{
            NSLog(@"第三页");
            [self transitionFromViewController:_currentViewController toViewController:_third duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                
            }  completion:^(BOOL finished) {
                if (finished) {
                    _currentViewController = _third;
                }else{
                    _currentViewController = oldViewController;
                }
            }];
        } break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
