//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownListHighlighter.h"


@implementation MKMarkdownListHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return [MKRegularExpressionHighlighter regexFromPattern:@"^(?:[ ]{0,3}(?:[*+-])[ \t]+)(.+)\n"];
}

- (NSDictionary *)attributes
{
  UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  return @{ NSFontAttributeName : font };
}

- (NSDictionary *)itemAttributes
{
  UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  return @{ NSFontAttributeName : font , NSForegroundColorAttributeName: [UIColor lightGrayColor]};
}

- (void)highlightAttributedString:(NSMutableAttributedString *)attributedString
{

  [MKRegularExpressionHighlighter enumerateMatches:self.regularExpression
                                            string:attributedString.string
                                             block:^(NSTextCheckingResult *obj)
                                             {
                                               [attributedString addAttributes:self.attributes
                                                                         range:obj.range];
                                               [attributedString addAttributes:self.itemAttributes
                                                                         range:[obj rangeAtIndex:1]];
                                             }];
}

@end
