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
    if (!self.delegates || ![self.delegates respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return YES;
    }
    return [self.delegates textView:textView shouldChangeTextInRange:range replacementText:text];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([self.delegates textView:textView shouldInteractWithURL:URL inRange:characterRange]) {
            return [self.delegates textView:textView shouldInteractWithURL:URL inRange:characterRange];
    } else {
        return NO;
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    if ([self.delegates textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange]) {
            return [self.delegates textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    } else {
        return NO;
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.delegates && [self.delegates respondsToSelector:@selector(textViewDidBeginEditing:)]) {
            return [self.delegates textViewDidBeginEditing:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if (self.delegates && [self.delegates respondsToSelector:@selector(textViewDidChangeSelection:)]) {
            return [self.delegates textViewDidChangeSelection:textView];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.delegates && [self.delegates respondsToSelector:@selector(textViewDidEndEditing:)]) {
            return [self.delegates textViewDidEndEditing:textView];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (!self.delegates || ![self.delegates respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        return YES;
    }
    return [self.delegates textViewShouldBeginEditing:textView];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (self.delegates && [self.delegates respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
                    return [self.delegates textViewShouldEndEditing:textView];
    } else {
        return YES;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    [self.delegates textViewDidChange:textView];
    [self fitToScrollView];
}


@end
