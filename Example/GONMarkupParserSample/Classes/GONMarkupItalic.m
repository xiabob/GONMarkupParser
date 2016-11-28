//
//  GONMarkupItalic.m
//  GONMarkupParserSample
//
//  Created by Nicolas Goutaland on 19/09/14.
//  Copyright (c) 2014 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupItalic.h"
#import "GONMarkup+Private.h"
#import <YYText/YYText.h>

@implementation GONMarkupItalic
#pragma mark - Constructor
+ (instancetype)italicMarkup
{
    return [super fontTraitsMarkup:GONMarkupItalic_TAG
                            traits:UIFontDescriptorTraitItalic];
}

- (NSAttributedString *)updatedContentString:(NSString *)string context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes stringAttributes:(NSDictionary *)stringAttributes {
    UIColor *color = stringAttributes[@"NSColor"] ?: [UIColor grayColor];
    UIFont *font = stringAttributes[@"NSFont"] ?: [UIFont systemFontOfSize:12];
    if ([dicAttributes[@"class"] isEqualToString:@"pstatus"]) {
        font = [UIFont systemFontOfSize:12];
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    
    //update stringAttributes
    NSMutableDictionary *config = [stringAttributes mutableCopy];
    [config setValuesForKeysWithDictionary:@{NSFontAttributeName: font, NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: style.copy}];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:config];
    attributedString.yy_textGlyphTransform = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0); //yytext 支持的斜体是yy_textGlyphTransform这个属性
    
    return attributedString;
    
    
    
    //    return [super updatedContentString:string context:context attributes:dicAttributes stringAttributes:stringAttributes];
}


@end
