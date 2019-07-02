# Code39Generator
[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Hank-Zhong/Code39Generator/blob/master/LICENSE)

iOS 条形码 code39 生成器

<img src="https://github.com/Hank-Zhong/Code39Generator/blob/master/code39.png" width="40%" height="40%">

使用简单，只需将"HYCode39.h"和"HYCode39.m"文件添加到项目中，导入头文件并且使用一行代码便搞定：

    #import "HYCode39.h"
  
    barCode1.image = [HYCode39 code39ImageWithString:@"A012345-Z"
                                     imageSize:CGSizeMake(w, h)];

也可以改变颜色和边距：

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
    
详细介绍请参考我的[博客](https://www.hlzhy.com/)或[简书](https://www.jianshu.com/p/443b73f72702)
