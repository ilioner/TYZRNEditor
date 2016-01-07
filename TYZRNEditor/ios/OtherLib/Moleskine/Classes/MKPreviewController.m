//
// Created by 史伟夫 on 8/11/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKPreviewController.h"
#import "MMMarkdown.h"

@interface MKPreviewController()

@property (nonatomic, strong) NSString *html;

@end


@implementation MKPreviewController
{
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  if(!self.title)
  {
    self.title = @"预览";
  }
  UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:webView];
  self.html = [MMMarkdown HTMLStringWithMarkdown:self.bodyMarkdown
                                      extensions:MMMarkdownExtensionsGitHubFlavored
                                           error:nil];
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"markdown" ofType:@"html"];
  NSString *content  = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  NSString *s = [self replaceString:content withDict:@{@"content": self.html}];

  NSString *path = [[NSBundle mainBundle] resourcePath];
  [webView loadHTMLString:s baseURL:nil];


  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(onSubmit:)];


}

- (void)onSubmit:(id)sender
{
  if(self.onComplete)
  {
    self.onComplete(self);
  }
}

- (NSString *)bodyMarkdown
{
  if(!_bodyMarkdown)
  {
    return @"";
  }
  return _bodyMarkdown;
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
