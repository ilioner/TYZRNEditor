//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownLinkHighlighter.h"
#import "MKRegularExpressionHighlighter.h"


@interface MKMarkdownLinkHighlighter()

@property (nonatomic, strong) NSRegularExpression *regex;

@end

@implementation MKMarkdownLinkHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return self.regex;
}

-(NSDictionary *)attributes
{
  return @{NSForegroundColorAttributeName:[UIColor colorWithRed:0.255 green:0.514 blue:0.769 alpha:1.00]};
}

- (NSRegularExpression *)regex
{
  if(!_regex)
  {
    _regex = [MKRegularExpressionHighlighter regexFromPattern:@"\\[([^\\[]+)\\]\\([ \t]*<?(.*?)>?[ \t]*((['\"])(.*?)\\4)?\\)"];
  }

  return _regex;
}

@end
