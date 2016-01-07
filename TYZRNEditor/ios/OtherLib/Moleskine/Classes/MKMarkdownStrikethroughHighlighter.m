//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownStrikethroughHighlighter.h"


@implementation MKMarkdownStrikethroughHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return [MKRegularExpressionHighlighter regexFromPattern:@"(~~)(?=\\S)(.+?)(?<=\\S)\\1"];
}

- (NSDictionary *)attributes
{
  return @{ NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)};
}

@end