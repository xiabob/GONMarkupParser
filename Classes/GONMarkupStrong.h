//
//  GONMarkupStrong.h
//  GONMarkupParserSample
//
//  Created by xiabob on 16/9/22.
//  Copyright © 2016年 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupFontTraits.h"

#define GONMarkupStrong_TAG                 @"strong"

@interface GONMarkupStrong : GONMarkupFontTraits

/* Default markup to add bold support */
+ (instancetype)strongMarkup;

@end
