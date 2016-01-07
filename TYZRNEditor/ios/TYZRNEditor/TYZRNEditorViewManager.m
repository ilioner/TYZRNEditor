//
//  TYZRNEditorViewManager.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorViewManager.h"
#import "RCTBridge.h"

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

RCT_EXPORT_METHOD(getContentStrMethod:(RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    callback(@[[NSNull null], [self getContentStr]]);
  });
}

RCT_EXPORT_METHOD(getTitleStrMethod:(RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    callback(@[[NSNull null], [self getTitleStr]]);
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

- (NSString *)getContentStr
{
  RCTLogInfo(@"%@",self.editorView.contentStr);
  return self.editorView.contentStr;
}

- (NSString *)getTitleStr
{
  RCTLogInfo(@"%@",self.editorView.titleStr);
  return self.editorView.titleStr;
}

@end
