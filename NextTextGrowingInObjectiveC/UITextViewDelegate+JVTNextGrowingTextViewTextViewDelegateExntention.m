//
//  UITextViewDelegate+JVTNextGrowingTextViewTextViewDelegateExntention.m
//  Teams
//
//  Created by Matan Cohen on 3/24/16.
//  Copyright © 2016 Jive. All rights reserved.
//

#import "UITextViewDelegate+JVTNextGrowingTextViewTextViewDelegateExntention.h"
#import "JVTNextGrowingTextView.h"

@implementation JVTNextGrowingTextView (UITextViewDelegate)

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (!self.delegates) {
        return YES;
    }
    return [self.delegates textView:textView shouldChangeTextInRange:range replacementText:text];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    return [self.delegates textView:textView shouldInteractWithURL:URL inRange:characterRange];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    return [self.delegates textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    return [self.delegates textViewDidBeginEditing:textView];
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    return [self.delegates textViewDidChangeSelection:textView];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    return [self.delegates textViewDidEndEditing:textView];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (!self.delegates) {
        return YES;
    }
    return [self.delegates textViewShouldBeginEditing:textView];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return [self.delegates textViewShouldEndEditing:textView];
}

- (void)textViewDidChange:(UITextView *)textView {
    [self.delegates textViewDidChange:textView];
    
    [self fitToScrollView];
}


@end
