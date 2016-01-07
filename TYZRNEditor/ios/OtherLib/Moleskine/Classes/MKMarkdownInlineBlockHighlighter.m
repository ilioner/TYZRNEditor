//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownInlineBlockHighlighter.h"


@implementation MKMarkdownInlineBlockHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return [MKRegularExpressionHighlighter regexFromPattern:@"(`+)(?:.+?)(?<!`)\\\\1(?!`)"];
}

- (NSDictionary *)attributes
{
  return @{NSForegroundColorAttributeName:[UIColor grayColor]};
}

@end