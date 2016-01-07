//
// Created by shiweifu on 8/6/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKRegularExpressionHighlighter.h"

@interface MKRegularExpressionHighlighter()

@property (nonatomic, strong) NSRegularExpression *regularExpression;
@property (nonatomic, strong) NSDictionary *attributes;

@end

@implementation MKRegularExpressionHighlighter
{

}

- (void)highlightAttributedString:(NSMutableAttributedString *)attributedString
{
  [MKRegularExpressionHighlighter enumerateMatches:self.regularExpression
                                            string:attributedString.string
                                             block:^(NSTextCheckingResult *obj)
                                             {
                                               [attributedString addAttributes:self.attributes
                                                                         range:obj.range];
                                             }];
}

+ (NSRegularExpression *)regexFromPattern:(NSString *)pattern
{
  NSError *error = nil;
  NSRegularExpression *regex;
  regex = [[NSRegularExpression alloc] initWithPattern:pattern
                                               options:NSRegularExpressionAnchorsMatchLines
                                                 error:&error];
  if(regex)
  {
    return regex;
  }
  return nil;
}

+ (UIFont *)fontWithTraits:(UIFontDescriptorSymbolicTraits)traits font:(UIFont *)font
{
  UIFontDescriptorSymbolicTraits combinedTraits = font.fontDescriptor.symbolicTraits | (traits & 0xFFFF);
  if(font.fontDescriptor)
  {
    return [UIFont fontWithDescriptor:font.fontDescriptor size:font.pointSize];
  }
  return font;
}

+ (void) enumerateMatches:(NSRegularExpression *)regex
                  string:(NSString *)string
                   block:(MKRegularExpressionBlock)block
{
  NSRange range = NSMakeRange(0, string.length);
  [regex enumerateMatchesInString:string options:nil range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
  {
    block(result);
  }];
}

@end
