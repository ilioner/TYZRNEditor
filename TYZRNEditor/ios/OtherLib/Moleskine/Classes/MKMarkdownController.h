//
// Created by 史伟夫 on 8/11/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MKMarkdownController : UIViewController

@property (nonatomic, copy) void (^onComplete) (UIViewController *);

@property (nonatomic, copy) NSString *defaultMarkdownText;

@end
