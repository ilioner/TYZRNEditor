//
//  TYZRNEditorView.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorView.h"

@implementation TYZRNEditorView

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

- (void)layoutSubviews
{
  DDLogVerbose(@"TYZRNEditorView");
  
}

- (void)startEditing
{
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.contentViewController startEditing];
  });
  
}

- (void)stopEditing
{
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.contentViewController stopEditing];
    [[self.contentViewController view] endEditing:YES];
  });
  
}

@end
