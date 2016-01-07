//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownStrongBlockHighlighter.h"


@implementation MKMarkdownStrongBlockHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return [MKRegularExpressionHighlighter regexFromPattern:@"\\**(?:^|[^*])(\\*\\*(\\w+(\\s\\w+)*)\\*\\*)"];
}

- (NSDictionary *)attributes
{
  return @{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]};
}

@end
