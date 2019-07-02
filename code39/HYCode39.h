//
//  HYCode39.h
//  code39
//
//  Created by Hank on 2019/7/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYCode39 : NSObject

+(UIImage *_Nullable)code39ImageWithString:(NSString *)string
                                 imageSize:(CGSize)imageSize;

+(UIImage *_Nullable)code39ImageWithString:(NSString *)string
                                 imageSize:(CGSize)imageSize
                                edgeInsets:(UIEdgeInsets)edgeInsets;

/**
 生成Code39条形码图片

 @param string 需要编码成条形码的字符，小写字母会被转换成大写字母，支持字符"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%*"，请勿携带*字符
 @param imageSize 生成图片的尺寸
 @param edgeInsets 条形码内容 相对于 图片四周的边距
 @param backColor 图片背景颜色
 @param barColor 条形码颜色
 @return 条形码图片，如传入非法字符则返回nil
 */
+(UIImage *_Nullable)code39ImageWithString:(NSString *)string
                                 imageSize:(CGSize)imageSize
                                edgeInsets:(UIEdgeInsets)edgeInsets
                           backgroundColor:(UIColor * _Nullable)backColor
                                  barColor:(UIColor * _Nullable)barColor;

@end

NS_ASSUME_NONNULL_END
