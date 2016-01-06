//
//  TYZRNEditorViewController.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "WPEditorViewController.h"

@interface TYZRNEditorViewController : WPEditorViewController <WPEditorViewControllerDelegate>

- (void)insertHtml:(NSString *)htmlStr;
- (void)hiddenAllKeyboard;
@end
