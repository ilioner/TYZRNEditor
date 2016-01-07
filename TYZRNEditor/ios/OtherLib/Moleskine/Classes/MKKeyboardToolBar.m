//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKKeyboardToolBar.h"

@interface MKKeyboardToolBar()

@property (nonatomic, strong) UIScrollView *insideView;
@property (nonatomic,strong)  UIView       *toolbarView;

@end

@implementation MKKeyboardToolBar
{

}

- (instancetype)initWithDataSource:(id<MKKeyboardToolBarDataSource>)dataSource {
  self = [super initWithFrame:CGRectMake(0, 0, self.window.rootViewController.view.bounds.size.width, 40)];
  if (self) {
    self.dataSource = dataSource;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:[self inputAccessoryView]];
    [self initButtons];
  }
  return self;
}

- (void)initButtons
{
  if(self.dataSource)
  {
    CGRect originFrame;
    CGFloat originX = self.inset;
    for (int i = 0; i < self.dataSource.numbersOfToolButton; ++i)
    {
      UIView *v = [self.dataSource viewWithIndex:i];
      [self.insideView addSubview:v];
      CGFloat inset = self.inset;
      CGFloat originY = (40 - v.frame.size.height) / 2;
      originFrame = CGRectMake(originX, originY, v.frame.size.width, v.frame.size.height);
      [v setFrame:originFrame];
      originX = originX + v.bounds.size.width + self.inset;
      v.tag = i;
      [v addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(handleTapView:)] ];
    }

    CGSize contentSize = CGSizeMake(originX, 40);
    self.insideView.contentSize = contentSize;
  }
}

- (void)handleTapView:(UITapGestureRecognizer *)tap
{
  NSInteger t = (NSInteger) tap.view.tag;
  [self.dataSource viewDidTapFromIndex:t];
}

- (NSUInteger)inset
{
  if(_inset <= 0)
  {
    _inset = 8;
  }
  return _inset;
}

-(void)reloadData
{
  [self.insideView removeFromSuperview];
  _insideView = nil;
  [_toolbarView addSubview:self.insideView];
  [self initButtons];
}

-(UIScrollView *)insideView
{
  if(!_insideView)
  {
    CGFloat w = self.window.rootViewController.view.bounds.size.width;
    _insideView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, w, 40)];
    _insideView.backgroundColor = [UIColor clearColor];
    _insideView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _insideView.showsHorizontalScrollIndicator = NO;
//    _insideView.contentInset = UIEdgeInsetsMake(6.0f, 0.0f, 8.0f, 6.0f);
  }
  return _insideView;
}

- (UIView *)inputAccessoryView {
  _toolbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
  _toolbarView.backgroundColor = [UIColor colorWithWhite:0.973 alpha:1.0];
  _toolbarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

  [_toolbarView addSubview:[self insideView]];

  return _toolbarView;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  self.insideView.backgroundColor = backgroundColor;
}


@end
