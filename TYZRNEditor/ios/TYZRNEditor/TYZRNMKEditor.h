//
//  TYZRNMKEditor.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/7.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKTextView.h"
@protocol TYZRNMKEditorDelegate;
@interface TYZRNMKEditor : UIView<UITextViewDelegate>
@property (nonatomic, weak) id<TYZRNMKEditorDelegate> markdownDelegate;

@property (nonatomic, assign) BOOL               isEditing;

@property (nonatomic, strong) NSString           *defaultMarkdownText;

@property (nonatomic, strong) MKTextView         *textView;

@property (nonatomic, strong) UIView             *navBarView;

@property (nonatomic, strong) UIButton           *leftButton;

@property (nonatomic, strong) UIButton           *rightButton;

@property (nonatomic, strong) NSString           *titleLabelStr;

@property (nonatomic, strong) UILabel            *titleLabel;
@end

@protocol TYZRNMKEditorDelegate <NSObject>

- (void)markdownView:(TYZRNMKEditor *)markdownView willGoBack:(BOOL)goBack;

@end
