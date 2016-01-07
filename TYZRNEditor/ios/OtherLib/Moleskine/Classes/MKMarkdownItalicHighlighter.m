//
// Created by 史伟夫 on 8/11/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownItalicHighlighter.h"


@implementation MKMarkdownItalicHighlighter
{
}

- (NSRegularExpression *)regularExpression
{
  return [MKRegularExpressionHighlighter regexFromPattern:@"\\**(?:^|[^*])(\\*(\\w+(\\s\\w+)*)\\*)"];
}

- (NSDictionary *)attributes {
  UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];

  UIFontDescriptor *fontDesc = [font fontDescriptor];
  fontDesc = [fontDesc fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitItalic];

  UIFont *italicsFont = [UIFont fontWithDescriptor:fontDesc size:font.pointSize];

  NSDictionary *italicsAttributes = @{ NSFontAttributeName: italicsFont };

  return italicsAttributes;
}

@end