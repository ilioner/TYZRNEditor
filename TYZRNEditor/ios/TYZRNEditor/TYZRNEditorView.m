//
//  TYZRNEditorView.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorView.h"

@implementation TYZRNEditorView

#pragma mark - instancetype
- (instancetype)init
{
  self = [super init];
  if (self) {
    self.contentViewController = [[TYZRNEditorViewController alloc] init];
    self.contentViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    [self addSubview:self.contentViewController.view];
  }
  return self;
}


#pragma mark - getter & setter
- (NSString *)htmlContentStr
{
  return self.contentViewController.bodyText;
}

- (NSString *)contentStr
{
  return self.contentViewController.bodyText;
}

- (NSString *)titleStr
{
  return self.contentViewController.titleText;
}

- (void)insertHTML:(NSString *)htmlStr
{
  [self.contentViewController insertHtml:htmlStr];
}

#pragma mark - public method

- (void)startEditing
{
    [self.contentViewController startEditing];
}

- (void)stopEditing
{
    [self.contentViewController stopEditing];
}

@end
