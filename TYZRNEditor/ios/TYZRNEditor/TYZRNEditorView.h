//
//  TYZRNEditorView.h
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPViewController.h"

@interface TYZRNEditorView : UIView

@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, strong) WPViewController *contentViewController;
@end
