//
// Created by Matan Cohen on 3/24/16.
// Copyright (c) 2016 Jive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface JVTNextGrowingInternalTextView : UITextView
@property (nonatomic, strong) NSAttributedString * placeholderAttributedText;
@property (nonatomic, assign) BOOL displayPlaceholder;
@end