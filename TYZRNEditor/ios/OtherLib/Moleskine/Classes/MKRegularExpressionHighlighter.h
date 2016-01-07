//
// Created by shiweifu on 8/6/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MKHighlighterType.h"


typedef void (^MKRegularExpressionBlock)(NSTextCheckingResult *obj);

@protocol MKRegularExpressionProtocol

- (NSRegularExpression *)regularExpression;
- (NSDictionary *)attributes;

@end

@interface MKRegularExpressionHighlighter : NSObject <MKHighlighterTypeProtocol>


+ (NSRegularExpression *)regexFromPattern:(NSString *)pattern;

+ (UIFont *)fontWithTraits:(UIFontDescriptorSymbolicTraits)traits
                      font:(UIFont *)font;

+ (void)enumerateMatches:(NSRegularExpression *)regex
                  string:(NSString *)string
                   block:(MKRegularExpressionBlock)block;
@end