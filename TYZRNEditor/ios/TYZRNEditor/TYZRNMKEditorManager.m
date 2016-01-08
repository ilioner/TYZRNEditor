//
//  TYZRNMKEditorManager.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/8.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNMKEditorManager.h"
#import "RCTBridge.h"

@implementation TYZRNMKEditorManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  self.markdownEditor = [[TYZRNMKEditor alloc] init];
  self.markdownEditor.markdownDelegate = self;
  RCTLogInfo(@"%@",self.markdownEditor);
  return self.markdownEditor;
}

RCT_EXPORT_VIEW_PROPERTY(defaultMarkdownText, NSString);


#pragma mark - TYZRNMKEditorDelegate
- (void)markdownView:(TYZRNMKEditor *)markdownView willGoBack:(BOOL)goBack
{
  NSDictionary *event = @{
                          @"eventAction":@"eventAction"
                          };
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"markdownEvent" body:event];
}
@end
