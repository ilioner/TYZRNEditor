//
//  TYZRNMKEditorManager.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/8.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RCTViewManager.h"
#import "TYZRNMKEditor.h"
@interface TYZRNMKEditorManager : RCTViewManager<TYZRNMKEditorDelegate>

@property (nonatomic, strong) TYZRNMKEditor *markdownEditor;

@end
