//
//  GONMarkupBlockQuote.h
//  GONMarkupParserSample
//
//  Created by xiabob on 16/11/28.
//  Copyright © 2016年 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkup.h"

#define GONMarkupBlockQuote_TAG                 @"blockquote"

@interface GONMarkupBlockQuote : GONMarkup

/* 引用的语句块 */
+ (instancetype)blockQuoteMarkup;

@end
