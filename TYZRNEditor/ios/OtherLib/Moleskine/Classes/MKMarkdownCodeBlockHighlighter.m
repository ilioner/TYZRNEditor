//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownCodeBlockHighlighter.h"


@implementation MKMarkdownCodeBlockHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return [MKRegularExpressionHighlighter regexFromPattern:@"(```\n([\\s\n\\d\\w[/[\\.,-\\/#!?@$%\\^&\\*;:|{}<>+=\\-'_~()\\\"\\[\\]\\\\]/]]*)\n```)"];
}

- (NSDictionary *)attributes
{
  UIFont *bodyFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  CGFloat size = bodyFont.pointSize;
  UIFont *f1 = [UIFont fontWithName:@"Menlo" size:size];
  if(!f1)
  {
    f1 = [UIFont fontWithName:@"Courier" size:size];
  }
  return @{NSForegroundColorAttributeName:[UIColor grayColor]};
}

@end