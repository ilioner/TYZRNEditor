//
//  TYZRNMKEditor.m
//  TYZRNEditor
//
//  Created by TywinZhang on 16/1/7.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TYZRNMKEditor.h"
#import "TYZENMKPreView.h"

@interface TYZRNMKEditor()
{
  BOOL _isPreViewShow;
}
@property (nonatomic, strong) TYZENMKPreView *preView;

@end

@implementation TYZRNMKEditor

- (instancetype)init
{
  self = [super init];
  if (self) {
    //初始化自定义navigationBar
    self.navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 64)];
    self.navBarView.backgroundColor = [UIColor redColor];
    
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 21, 80, 40)];
    [self.leftButton setTitle:@"编辑" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W-90, 21, 80, 40)];
    [self.rightButton setTitle:@"预览" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W/2-((SCREEN_W-180)/2), 21, SCREEN_W-180, 40)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = @"MK编辑器";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    
    
    [self.navBarView addSubview:self.leftButton];
    [self.navBarView addSubview:self.rightButton];
    [self.navBarView addSubview:self.titleLabel];
    
    [self addSubview:self.navBarView];
    
    self.textView = [[MKTextView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.textView.delegate = self;
    [self.textView becomeFirstResponder];
    
    self.textView.text = self.defaultMarkdownText;
    [self addSubview:_textView];
    
    _isPreViewShow = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
  }
  return self;
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWasShown:(NSNotification *)notification
{
  CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
  
  float height = [self bounds].size.height - self.textView.frame.origin.y - keyboardSize.height;// - self.toolBar.frameSizeHeight;
  self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, SCREEN_W, height);
}

- (void)leftButtonAction
{
  
}

- (void)rightButtonAction
{
  
  if (_isPreViewShow) {
    [self.textView becomeFirstResponder];
    _isPreViewShow = NO;
    self.leftButton.hidden = NO;
    self.titleLabelStr = @"编辑";
    [self.rightButton setTitle:@"预览" forState:UIControlStateNormal];
    [_preView removeFromSuperview];
  }else{
    [self.textView resignFirstResponder];
    _isPreViewShow = YES;
    self.leftButton.hidden = YES;
    self.titleLabelStr = @"预览";
    [self.rightButton setTitle:@"取消" forState:UIControlStateNormal];
    _preView = [[TYZENMKPreView alloc] initWithFrame:self.textView.frame];
    _preView.frame = CGRectMake(0, 64, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _preView.bodyMarkdown = self.textView.text;
    [self addSubview:_preView];
    
  }
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
  [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
  [textView resignFirstResponder];
}
@end
