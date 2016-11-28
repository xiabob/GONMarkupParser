//
//  GONMarkupBlockQuote.m
//  GONMarkupParserSample
//
//  Created by xiabob on 16/11/28.
//  Copyright © 2016年 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupBlockQuote.h"
#import <YYText/YYText.h>

@implementation GONMarkupBlockQuote

+ (instancetype)blockQuoteMarkup {
    return [self markupForTag:GONMarkupBlockQuote_TAG];
}


- (void)openingMarkupFound:(NSString *)tag configuration:(NSMutableDictionary *)configurationDictionary context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes {
    [configurationDictionary setObject:[UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1] forKey:NSForegroundColorAttributeName];
    [configurationDictionary setObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    
    YYTextBorder *border = [[YYTextBorder alloc] init];
    border.lineStyle = YYTextLineStyleNone;
    border.fillColor = [UIColor colorWithWhite:0.184 alpha:0.090];
    border.cornerRadius = 4;
    border.insets = UIEdgeInsetsMake(0, 0, -4, 0);
    [configurationDictionary setObject:border forKey:YYTextBlockBorderAttributeName];
    
    //设置每一行首尾的空白间距
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.firstLineHeadIndent = 4;
    style.headIndent = 4; //不包括第一行
    style.tailIndent = -2;
    [configurationDictionary setObject:style forKey:NSParagraphStyleAttributeName];
}

- (NSAttributedString *)updatedContentString:(NSString *)string context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes stringAttributes:(NSDictionary *)stringAttributes {
    if (string.length == 0) {
        return [[NSAttributedString alloc] initWithString:@""];
    }
    
    NSString *processedString = [NSString stringWithFormat:@"%@\n", string];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:processedString attributes:stringAttributes];
    
    return attributedString;
}

- (NSAttributedString *)suffixStringForContext:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes stringAttributes:(NSDictionary *)stringAttributes {
    return [[NSAttributedString alloc] initWithString:@"\n"];
}

@end
