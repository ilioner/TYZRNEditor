//
//  TYZRNEditorView.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorView.h"

@implementation TYZRNEditorView

- (void)layoutSubviews
{
  DDLogVerbose(@"TYZRNEditorView");
  self.contentViewController = [[WPViewController alloc] init];
  self.contentViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
  [self addSubview:self.contentViewController.view];
}


@end
