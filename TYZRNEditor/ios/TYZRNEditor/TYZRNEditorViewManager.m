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
  self.editorView.delegate = self;
  RCTLogInfo(@"%@",self.editorView);
  return self.editorView;
}

RCT_EXPORT_VIEW_PROPERTY(contentStr, NSString);
RCT_EXPORT_VIEW_PROPERTY(titleStr, NSString);

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

RCT_EXPORT_METHOD(insertHTML:(NSString *)html)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    [self insertNewHTML:html];
  });
}

#pragma mark - TYZRNEditorViewDelegate

- (void)editorView:(TYZRNEditorView *)editorView title:(NSString *)title content:(NSString *)content
{
  NSDictionary *event = @{
                          @"target": @(100),
                          @"tltle":title,
                          @"content":content
                          };
  [self.bridge.eventDispatcher sendInputEventWithName:@"topChange" body:event];
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

- (void)insertNewHTML:(NSString *)html
{
  [self.editorView insertHTML:html];
}
@end
