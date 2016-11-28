//
//  GONMarkupImage.m
//  GONMarkupParserSample
//
//  Created by Nicolas Goutaland on 04/03/16.
//  Copyright © 2016 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupImage.h"
#import <YYImage/YYImage.h>
#import <YYText/YYText.h>
#import <YYWebImage/YYWebImage.h>

@implementation GONMarkupImage
+ (instancetype)imageMarkup
{
    return [self markupForTag: GONMarkupImage_TAG];
}

- (NSAttributedString *)updatedContentString:(NSString *)string context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes stringAttributes:(NSDictionary *)stringAttributes
{
    YYImage *image;
    int em = [dicAttributes[@"em"] intValue];
    NSString *url = dicAttributes[@"src"];
    
    if (em > 0) {
        NSString *emName = [NSString stringWithFormat:@"em%d.gif", em];
        image = [YYImage imageNamed:emName];
        if (image) {
            return [NSAttributedString yy_attachmentStringWithEmojiImage:image fontSize:24];
        }
    }
    
    //http://img.lkong.cn/bq/em68.gif
    if ([url rangeOfString:@"/bq/em"].length > 0) {
        NSString *emName = [url componentsSeparatedByString:@"/"].lastObject;
        image = [YYImage imageNamed:emName];
        if (image) {
            return [NSAttributedString yy_attachmentStringWithEmojiImage:image fontSize:24];
        }
    }
    
    if (url.length > 0 && dicAttributes != nil) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width - 32;
        //展示动图
        YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, width, width*0.5)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView yy_setImageWithURL:[NSURL URLWithString:url]
                          placeholder:nil
                              options:YYWebImageOptionAllowBackgroundTask
                              manager:nil
                             progress:nil
                            transform:nil
                           completion:nil];
        
        NSMutableAttributedString *attributedString = [NSAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView.frame.size alignToFont:[UIFont systemFontOfSize:16] alignment:YYTextVerticalAlignmentCenter];
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        highlight.userInfo = @{@"linkAttributes": dicAttributes};
        [attributedString yy_setTextHighlight:highlight range:attributedString.yy_rangeOfAll];
        
        return attributedString;
    }
    
    return [super updatedContentString:string context:context attributes:dicAttributes stringAttributes:stringAttributes];
}

@end
