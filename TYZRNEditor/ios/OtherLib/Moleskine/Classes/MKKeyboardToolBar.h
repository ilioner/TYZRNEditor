//
// Created by shiweifu on 8/7/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MKKeyboardToolBarDataSource

- (NSUInteger)numbersOfToolButton;
- (UIView *)viewWithIndex:(NSUInteger)index;
- (void)viewDidTapFromIndex:(NSUInteger)index;

@end

@interface MKKeyboardToolBar : UIView

@property (nonatomic, assign) NSUInteger inset;
@property (nonatomic, assign) id <MKKeyboardToolBarDataSource> dataSource;

- (instancetype)initWithDataSource:(id <MKKeyboardToolBarDataSource>)dataSource;

-(void)reloadData;

@end
