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
  dispatch_async(dispatch_get_main_queue(), ^{
      if (isEditing == NO) {
        [self stopEditing];
      }else{
        [self startEditing];
      }
  });
}

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    callback(@[[NSNull null], [self getContentStr]]);
  });
}

- (void)startEditing{
  [self.editorView startEditing];
}

- (void)stopEditing{
  [self.editorView stopEditing];
}

- (NSString *)getContentStr
{
  return self.editorView.htmlContentStr;
}
@end
