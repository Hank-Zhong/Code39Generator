//
//  HYCode39.m
//  code39
//
//  Created by Hank on 2019/7/1.
//

#import "HYCode39.h"

@implementation HYCode39

+(UIImage *_Nullable)code39ImageWithString:(NSString *)string
                                 imageSize:(CGSize)imageSize{
    
    return [self code39ImageWithString:string imageSize:imageSize edgeInsets:UIEdgeInsetsZero backgroundColor:nil barColor:nil];
}

+(UIImage *_Nullable)code39ImageWithString:(NSString *)string
                                 imageSize:(CGSize)imageSize
                                edgeInsets:(UIEdgeInsets)edgeInsets{
    
    return [self code39ImageWithString:string imageSize:imageSize edgeInsets:edgeInsets backgroundColor:nil barColor:nil];
}

+(UIImage *_Nullable)code39ImageWithString:(NSString *)string
                                 imageSize:(CGSize)imageSize
                                edgeInsets:(UIEdgeInsets)edgeInsets
                           backgroundColor:(UIColor * _Nullable)backColor
                                  barColor:(UIColor * _Nullable)barColor{
    
    string = [string uppercaseString];
    NSInteger strLength = string.length;
    //初始化并添加起始码'*'
    NSMutableString *codeString = [NSMutableString stringWithFormat:@"010010100"];
    NSString *alphabet = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%*";
    NSString *code39[] = {
        /* 0 */ @"000110100",
        /* 1 */ @"100100001",
        /* 2 */ @"001100001",
        /* 3 */ @"101100000",
        /* 4 */ @"000110001",
        /* 5 */ @"100110000",
        /* 6 */ @"001110000",
        /* 7 */ @"000100101",
        /* 8 */ @"100100100",
        /* 9 */ @"001100100",
        /* A */ @"100001001",
        /* B */ @"001001001",
        /* C */ @"101001000",
        /* D */ @"000011001",
        /* E */ @"100011000",
        /* F */ @"001011000",
        /* G */ @"000001101",
        /* H */ @"100001100",
        /* I */ @"001001100",
        /* J */ @"000011100",
        /* K */ @"100000011",
        /* L */ @"001000011",
        /* M */ @"101000010",
        /* N */ @"000010011",
        /* O */ @"100010010",
        /* P */ @"001010010",
        /* Q */ @"000000111",
        /* R */ @"100000110",
        /* S */ @"001000110",
        /* T */ @"000010110",
        /* U */ @"110000001",
        /* V */ @"011000001",
        /* W */ @"111000000",
        /* X */ @"010010001",
        /* Y */ @"110010000",
        /* Z */ @"011010000",
        /* - */ @"010000101",
        /* . */ @"110000100",
        /*' '*/ @"011000100",
        /* $ */ @"010101000",
        /* / */ @"010100010",
        /* + */ @"010001010",
        /* % */ @"000101010",
        /* * */ @"010010100"
    };
    
    for (int i = 0; i < strLength; i++) {
        unichar c = [string characterAtIndex:i];
        NSInteger index = [alphabet rangeOfString:[NSString stringWithFormat:@"%c",c]].location;
        if ((index == NSNotFound) || (c == '*')) {
#ifdef DEBUG
            NSLog(@"<%s : %d> %s\n非法字符！", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__);
#endif
            return nil;
        }
        //拼接数据码，每个码前面都添加一个0作为分割
        [codeString appendString:[NSString stringWithFormat:@"0%@",code39[index]]];
    }
    //终止码'*'，前面加0作为分割
    [codeString appendString:@"0010010100"];
    
    CGFloat x = edgeInsets.left;
    CGFloat y = edgeInsets.top;
    CGFloat narrowBarW = ((imageSize.width - edgeInsets.left - edgeInsets.right) / (strLength + 2)) / 13.0;
    CGFloat widthBarW = narrowBarW * 2;
    CGFloat barH = imageSize.height - edgeInsets.top - edgeInsets.bottom;
    if (!backColor) {
        backColor = [UIColor whiteColor];
    }
    if (!barColor) {
        barColor = [UIColor blackColor];
    }
    
    //开始绘制条形码
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, backColor.CGColor);
    CGContextFillRect(context, CGRectMake(0.0, 0.0, imageSize.width, imageSize.height));
    
    for (int i = 0; i < codeString.length; i++) {
        CGFloat barW = [codeString characterAtIndex:i] == '1' ? widthBarW : narrowBarW;
        if (i % 2 == 1) {
            CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.0);
        }else{
            CGContextSetFillColorWithColor(context, barColor.CGColor);
        }
        CGContextFillRect(context, CGRectMake(x, y, barW, barH));
        x += barW;
    }
    //导出绘制完成的条形码图片
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

@end
