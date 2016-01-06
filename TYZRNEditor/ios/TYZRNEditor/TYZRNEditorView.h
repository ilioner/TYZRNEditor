//
//  TYZRNEditorView.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYZRNEditorViewController.h"

@interface TYZRNEditorView : UIView

@property (nonatomic, assign) BOOL isEditing;

@property (nonatomic, strong) NSString *htmlContentStr;

@property (nonatomic, strong) NSString *contentStr;

@property (nonatomic, strong) NSString *titleStr;

@property (nonatomic, strong) TYZRNEditorViewController *contentViewController;

@property (nonatomic, strong) NSString *htmlStr;
- (void)stopEditing;
- (void)startEditing;
@end
