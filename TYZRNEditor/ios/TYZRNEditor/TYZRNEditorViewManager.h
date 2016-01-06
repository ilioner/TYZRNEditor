//
//  TYZRNEditorViewManager.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RCTViewManager.h"
#import "TYZRNEditorView.h"

@interface TYZRNEditorViewManager : RCTViewManager<RCTBridgeModule>

@property (nonatomic, strong) TYZRNEditorView *editorView;

@end
