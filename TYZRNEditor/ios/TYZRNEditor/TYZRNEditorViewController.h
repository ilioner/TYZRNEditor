//
//  TYZRNEditorViewController.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "WPEditorViewController.h"

@protocol TYZRNEditorViewControllerDelegate;

@interface TYZRNEditorViewController : WPEditorViewController <WPEditorViewControllerDelegate>
@property (nonatomic, weak) id<TYZRNEditorViewControllerDelegate> editorDelegate;
@property (nonatomic, strong) NSString *tltleString;
@property (nonatomic, strong) NSString *contentString;
- (void)insertHtml:(NSString *)htmlStr;
@end

@protocol TYZRNEditorViewControllerDelegate <NSObject>

- (void)editorViewController:(TYZRNEditorViewController *)vc didEndSelectImage:(BOOL)flag;

@end
