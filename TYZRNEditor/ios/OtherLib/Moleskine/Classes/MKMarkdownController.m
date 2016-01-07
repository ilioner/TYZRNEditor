//
// Created by 史伟夫 on 8/11/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKMarkdownController.h"
#import "MKTextView.h"
#import "MKPreviewController.h"

@interface MKMarkdownController() <UITextViewDelegate>

@property (nonatomic, strong) MKTextView *textView;

@end


@implementation MKMarkdownController
{

}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.textView = [[MKTextView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:_textView];
  if(!self.title)
  {
    self.title = @"编辑";
  }

  self.view.backgroundColor = [UIColor whiteColor];

  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"预览"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(onPreview:)];

  self.textView.delegate = self;
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWasShown:)
                                               name:UIKeyboardDidShowNotification
                                             object:nil];

  [self.textView becomeFirstResponder];

  self.textView.text = self.defaultMarkdownText;
}

- (void)onPreview:(id)onPreview
{
  MKPreviewController *previewController = MKPreviewController.new;
  previewController.bodyMarkdown = self.textView.text;
  previewController.onComplete   = self.onComplete;
  [self.navigationController pushViewController:previewController
                                       animated:YES];
}

- (void)keyboardWasShown:(NSNotification *)notification
{
  CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;

  float height = [self.view bounds].size.height - self.textView.frame.origin.y - keyboardSize.height;// - self.toolBar.frameSizeHeight;
  self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, CGRectGetWidth([[UIApplication sharedApplication] keyWindow].frame), height);
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