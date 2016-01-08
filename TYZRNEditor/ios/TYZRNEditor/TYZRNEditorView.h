//
//  TYZRNEditorView.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYZRNEditorViewController.h"
@protocol TYZRNEditorViewDelegate;
@interface TYZRNEditorView : UIView<TYZRNEditorViewControllerDelegate>

@property (nonatomic, weak) id<TYZRNEditorViewDelegate> delegate;

@property (nonatomic, assign) BOOL                      isEditing;

@property (nonatomic, strong) NSString                  *contentStr;

@property (nonatomic, strong) NSString                  *titleStr;

@property (nonatomic, strong) TYZRNEditorViewController *contentViewController;

@property (nonatomic, strong) UIView                    *navBarView;

@property (nonatomic, strong) UIButton                  *leftButton;

@property (nonatomic, strong) UIButton                  *rightButton;

@property (nonatomic, strong) NSString                  *titleLabelStr;

@property (nonatomic, strong) UILabel                   *titleLabel;

- (void)stopEditing;
- (void)startEditing;
@end


@protocol TYZRNEditorViewDelegate <NSObject>

- (void)editorView:(TYZRNEditorView *)editorView title:(NSString *)title content:(NSString *)content;
- (void)editorView:(TYZRNEditorView *)editorView willGoBack:(BOOL)back;

@end