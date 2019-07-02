//
//  ViewController.m
//  code39
//
//  Created by Hank on 2019/7/1.
//

#import "ViewController.h"

#import "HYCode39.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    CGFloat x = 10;
    CGFloat w = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat h = 50;
    
    UIImageView *barCode1 = [[UIImageView alloc] initWithFrame:CGRectMake(x, 300, w, h)];
    barCode1.image = [HYCode39 code39ImageWithString:@"A012345-Z"
                                     imageSize:CGSizeMake(w, h)];
    [self.view addSubview:barCode1];
    

    UIImageView *barCode2 = [[UIImageView alloc] initWithFrame:CGRectMake(x, 400, w, h)];
    barCode2.image = [HYCode39 code39ImageWithString:@"012345STUVWXYZ-. $/+%"
                                     imageSize:CGSizeMake(800, h)
                                    edgeInsets:UIEdgeInsetsMake(5, 10, 5, 10)];
    [self.view addSubview:barCode2];
    
    
    UIImageView *barCode3 = [[UIImageView alloc] initWithFrame:CGRectMake(x, 500, w, h)];
    barCode3.image = [HYCode39 code39ImageWithString:@"WWW.HLZHY.COM"
                                     imageSize:CGSizeMake(600, h)
                                    edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)
                               backgroundColor:[UIColor whiteColor]
                                      barColor:[UIColor colorWithRed:1 green:0.75 blue:0.79 alpha:1]];
    [self.view addSubview:barCode3];
    
    UIImageView *barCode4 = [[UIImageView alloc] initWithFrame:CGRectMake(x, 600, w, h)];
    barCode4.image = [HYCode39 code39ImageWithString:@"Hank-Zhong"
                                           imageSize:CGSizeMake(1200, h)
                                          edgeInsets:UIEdgeInsetsMake(5, 0, 5, 0)
                                     backgroundColor:[UIColor colorWithRed:1 green:0.75 blue:0.79 alpha:1]
                                            barColor:nil];
    [self.view addSubview:barCode4];
}


@end
