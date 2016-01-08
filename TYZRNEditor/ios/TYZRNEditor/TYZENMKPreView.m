//
//  TYZENMKPreView.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/7.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZENMKPreView.h"
#import "MMMarkdown.h"

@interface TYZENMKPreView()

@property (nonatomic, strong) UIWebView *contentWebView;

@end

@implementation TYZENMKPreView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _contentWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), SCREEN_H-64)];
    _contentWebView.scrollView.bounces = NO;
    [self addSubview:_contentWebView];
    
  }
  return self;
}

- (void)setBodyMarkdown:(NSString *)bodyMarkdown
{
  self.html = [MMMarkdown HTMLStringWithMarkdown:bodyMarkdown
                                      extensions:MMMarkdownExtensionsGitHubFlavored
                                           error:nil];
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"markdown" ofType:@"html"];
  NSString *content  = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  NSString *s = [self replaceString:content withDict:@{@"content": self.html}];
  [_contentWebView loadHTMLString:self.html baseURL:nil];
  _bodyMarkdown = bodyMarkdown;
}

#pragma mark - Utils

- (NSString *)replaceString:(NSString *)s withDict:(NSDictionary *)dictionary
{
  for (int i = 0; i < dictionary.allKeys.count; ++i)
  {
    NSString *k = dictionary.allKeys[i];
    NSString *v = dictionary[k];
    k = [NSString stringWithFormat:@"###%@###", k];
    s = [s stringByReplacingOccurrencesOfString:k withString:v];
  }
  
  return s;
}

@end
