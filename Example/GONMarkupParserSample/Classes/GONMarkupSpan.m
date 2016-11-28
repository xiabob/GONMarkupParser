//
//  GONMarkupSpan.m
//  Lkong
//
//  Created by xiabob on 16/10/11.
//  Copyright © 2016年 xiabob. All rights reserved.
//

#import "GONMarkupSpan.h"
#import "NSString+Color.h"

@implementation GONMarkupSpan

+ (instancetype)spanMarkup {
    return [self markupForTag:GONMarkupSpan_TAG];
}

- (void)openingMarkupFound:(NSString *)tag configuration:(NSMutableDictionary *)configurationDictionary context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes {
    if (dicAttributes) {
        NSString *value;
        
        //style
        value = [dicAttributes objectForKey:@"style"];
        NSRange colorRange = [value rangeOfString:@"color:"];
        if (colorRange.length > 0) { //color
            NSString *colorString = [[value substringFromIndex:6+colorRange.location] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
            colorString = [colorString stringByReplacingOccurrencesOfString:@";" withString:@""];
            UIColor *color = [colorString representedColor];
            if (color) {
                [configurationDictionary setObject:color
                                            forKey:NSForegroundColorAttributeName];
            }
        }
        
    } else {
        return [super openingMarkupFound:tag configuration:configurationDictionary context:context attributes:dicAttributes];
    }
}

@end
