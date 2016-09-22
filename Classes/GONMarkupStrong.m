//
//  GONMarkupStrong.m
//  GONMarkupParserSample
//
//  Created by xiabob on 16/9/22.
//  Copyright © 2016年 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupStrong.h"

@implementation GONMarkupStrong

+ (instancetype)strongMarkup {
    return [super fontTraitsMarkup:GONMarkupStrong_TAG
                            traits:UIFontDescriptorTraitBold];
}

@end
