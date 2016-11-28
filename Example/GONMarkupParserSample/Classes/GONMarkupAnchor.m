//
//  GONMarkupAnchor.m
//  GONMarkupParserSample
//
//  Created by Nicolas Goutaland on 04/02/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupAnchor.h"
#import <YYText/YYText.h>

@interface GONMarkupAnchor ()
@end

@implementation GONMarkupAnchor
#pragma mark - Constructor
+ (instancetype)anchorMarkup
{
    return [self markupForTag:GONMarkupAnchor_TAG];
}

#pragma mark - Style
- (void)openingMarkupFound:(NSString *)tag configuration:(NSMutableDictionary *)configurationDictionary context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes
{
    if (_openingMarkupBlock) {
        _openingMarkupBlock(configurationDictionary, tag, context, dicAttributes);
    }
    
    NSString *value = [dicAttributes objectForKey:GONMarkupAnchor_TAG_href_ATT];
    if (value)
    {
        // Create URL based on value
        [configurationDictionary setObject:value
                                    forKey:NSLinkAttributeName];
    }
}

- (NSAttributedString *)updatedContentString:(NSString *)string context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes stringAttributes:(NSDictionary *)stringAttributes {
    NSMutableDictionary *config = [stringAttributes mutableCopy];
    //链接单独处理
    if ([config.allKeys containsObject:@"NSLink"] && dicAttributes != nil) {
        UIFont *font = config[@"NSFont"] ?: [UIFont systemFontOfSize:18];
        UIColor *color = config[@"NSColor"] ?: [UIColor blueColor];
        //update config attribute
        [config setValue:font forKey:NSFontAttributeName];
        [config setValue:color forKey:NSForegroundColorAttributeName];
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        highlight.userInfo = @{@"linkAttributes": dicAttributes};
        [highlight setColor:[UIColor grayColor]];
        [highlight setFont:font];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:config];
        [attributedString yy_setTextHighlight:highlight range:attributedString.yy_rangeOfAll];
        
        return attributedString;
    } else {
        return [super updatedContentString:string context:context attributes:dicAttributes stringAttributes:stringAttributes];
    }
}

@end

