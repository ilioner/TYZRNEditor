//
//  TYZRNEditorViewManager.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorViewManager.h"
#import "TYZRNEditorView.h"
@implementation TYZRNEditorViewManager


RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [[TYZRNEditorView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(isEditing, BOOL);


@end
