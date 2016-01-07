//
// Created by 史伟夫 on 8/11/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MKPreviewController : UIViewController

@property (nonatomic, strong) NSString *bodyMarkdown;

@property (nonatomic, copy) void (^onComplete) (MKPreviewController *);
@end
