//
//  MKTextView.h
//  Moleskine
//
//  Created by shiweifu on 8/5/15.
//  Copyright (c) 2015 shiweifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKKeyboardToolBar.h"


@class MKTextView;

@protocol MKTextViewEventDelegate <NSObject>

@optional

- (void)onHR:(MKTextView *)textView;
- (void)onTitle:(MKTextView *)textView;
- (void)onOl:(MKTextView *)textView;
- (void)onImg:(MKTextView *)textView;
- (void)onCode:(MKTextView *)textView;
- (void)onQuote:(MKTextView *)textView;
- (void)onLink:(MKTextView *)textView;
- (void)onItalic:(MKTextView *)textView;
- (void)onBold:(MKTextView *)textView;

@end


@class MKKeyboardToolBar;

@interface MKTextView : UITextView <UITextViewDelegate, MKKeyboardToolBarDataSource>

@property (nonatomic, strong) MKKeyboardToolBar *toolBar;
@property (nonatomic, weak) id<MKTextViewEventDelegate> mkDelegate;

@end
