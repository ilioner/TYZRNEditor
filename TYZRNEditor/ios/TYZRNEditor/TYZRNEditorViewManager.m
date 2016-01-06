//
//  TYZRNEditorViewManager.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorViewManager.h"

@implementation TYZRNEditorViewManager


RCT_EXPORT_MODULE()

- (UIView *)view
{
  self.editorView = [[TYZRNEditorView alloc] init];
  RCTLogInfo(@"%@",self.editorView);
  return self.editorView;
}

RCT_EXPORT_VIEW_PROPERTY(isEditing, BOOL);

RCT_EXPORT_METHOD(editingAction:(BOOL)isEditing)
{
  RCTLogInfo(@"%@",self.editorView);
  if (isEditing == NO) {
    [self stopEditing];
  }else{
    [self startEditing];
  }
  
}

- (void)startEditing{
  [self.editorView startEditing];
}

- (void)stopEditing{
  [self.editorView stopEditing];
}

@end
