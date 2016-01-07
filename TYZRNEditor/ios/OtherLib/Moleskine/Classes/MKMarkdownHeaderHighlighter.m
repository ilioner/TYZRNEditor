//
// Created by shiweifu on 8/6/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownHeaderHighlighter.h"


@interface MKMarkdownHeaderHighlighter()

@property (nonatomic, strong) NSRegularExpression *regex;

@end

@implementation MKMarkdownHeaderHighlighter
{

}

- (NSRegularExpression *)regularExpression
{
  return self.regex;
}

-(NSDictionary *)attributes
{
  return @{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]};
}

- (NSRegularExpression *)regex
{
  if(!_regex)
  {
    _regex = [MKRegularExpressionHighlighter regexFromPattern:@"^(\\#{1,6})[ \t]*(?:.+?)[ \t]*\\#*\n+"];
  }

  return _regex;
}

- (void)highlightAttributedString:(NSMutableAttributedString *)attributedString
{
  [MKRegularExpressionHighlighter enumerateMatches:self.regex
                                            string:attributedString.string
                                             block:^(NSTextCheckingResult *obj)
                                             {
                                               [attributedString addAttributes:self.attributes
                                                                         range:obj.range];
                                             }];
}

@end
