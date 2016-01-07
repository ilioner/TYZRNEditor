//
//  TYZRNEditorView.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNEditorView.h"

@implementation TYZRNEditorView

#pragma mark - instancetype
- (instancetype)init
{
  self = [super init];
  if (self) {
    
    //初始化编辑器
    self.contentViewController = [[TYZRNEditorViewController alloc] initWithMode:kWPEditorViewControllerModeEdit];
    self.contentViewController.view.frame = CGRectMake(0, 64, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    self.contentViewController.editorDelegate = self;
    [self addSubview:self.contentViewController.view];
    
    
    //初始化自定义navigationBar
    self.navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 64)];
    self.navBarView.backgroundColor = [UIColor redColor];
    
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 21, 80, 40)];
    [self.leftButton setTitle:@"编辑" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W-90, 21, 80, 40)];
    [self.rightButton setTitle:@"查看源码" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(htmlContentStrAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W/2-((SCREEN_W-180)/2), 21, SCREEN_W-180, 40)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = @"编辑器";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    
    
    [self.navBarView addSubview:self.leftButton];
    [self.navBarView addSubview:self.rightButton];
    [self.navBarView addSubview:self.titleLabel];
    
    [self addSubview:self.navBarView];
    
//    self.rightButton.hidden = YES;
    
    self.isEditing = NO;
   
  }
  return self;
}

- (void)layoutSubviews
{
  self.navBarView.frame = CGRectMake(0, 0, SCREEN_W, 64);
  self.contentViewController.view.frame = CGRectMake(0, 64, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

#pragma mark - getter & setter

- (NSString *)contentStr
{
  return self.contentViewController.bodyText;
}

- (NSString *)titleStr
{
  return self.contentViewController.titleText;
}

- (void)setContentStr:(NSString *)contentStr
{
  self.contentViewController.contentString = contentStr;
}

- (void)setTitleStr:(NSString *)titleStr
{
  self.contentViewController.tltleString = titleStr;
}

- (void)setTitleLabelStr:(NSString *)titleLabelStr
{
  self.titleLabel.text = titleLabelStr;
}

- (void)leftButtonAction
{
  if (!self.isEditing) {
    self.isEditing = YES;
    [self startEditing];
    [self.leftButton setTitle:@"取消" forState:UIControlStateNormal];
  }else{
    self.isEditing = NO;
    [self stopEditing];
    [self.leftButton setTitle:@"编辑" forState:UIControlStateNormal];
  }
}

#pragma mark - public method

- (void)startEditing
{
    [self.contentViewController startEditing];
}

- (void)stopEditing
{
    [self.contentViewController stopEditing];
}

- (void)htmlContentStrAction
{
  NSString *content = self.contentViewController.bodyText;
  NSString *title = self.contentViewController.titleText;
  [self.delegate editorView:self title:title content:content];
  DDLogVerbose(@"源码:==============>\n%@",content);
}

#pragma mark - TYZRNEditorViewControllerDelegate
- (void)editorViewController:(TYZRNEditorViewController *)vc didEndSelectImage:(BOOL)flag
{
  [self setNeedsLayout];
}

@end
