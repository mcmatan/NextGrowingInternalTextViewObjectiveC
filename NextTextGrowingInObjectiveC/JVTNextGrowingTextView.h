//
// Created by Matan Cohen on 3/24/16.
// Copyright (c) 2016 Jive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JVTNextGrowingTextViewDelegate <NSObject>
@optional
- (void)textViewDidBeginEditing:(UITextView *)textView ;
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text ;
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange ;
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange ;
- (void)textViewDidChangeSelection:(UITextView *)textView ;
- (void)textViewDidEndEditing:(UITextView *)textView ;
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView ;
- (void)textViewDidChange:(UITextView *)textView;

-(void) willChangeHeight:(CGFloat) height;
-(void) didChangeHeight:(CGFloat) height;
@end

@interface JVTNextGrowingTextView : UIScrollView

@property (nonatomic,assign) int maxNumberOfLines;
@property (nonatomic,assign) int minNumberOfLines;
@property (nonatomic,assign) int maxHeight;
@property (nonatomic,assign) int minHeight;


@property (nonatomic,weak) id<JVTNextGrowingTextViewDelegate> delegates;
@property (nonatomic,strong, getter =_inputView) UIView *inputView;

@property(nonatomic, strong, getter=getPlaceholderAttributedText) NSAttributedString *placeholderAttributedText;
@property(nonatomic, strong, getter=getText) NSString *text;
@property(nonatomic, strong, getter=getFont) UIFont *font;
@property(nonatomic, strong, getter=getTextColor) UIColor *textColor;
@property(nonatomic, assign, getter=getTextAlignment) NSTextAlignment textAlignment;
@property(nonatomic, assign, getter=getSelectedRange) NSRange selectedRange;
@property(nonatomic, assign, getter=getDataDetectorTypes) UIDataDetectorTypes dataDetectorTypes;
@property(nonatomic, assign, getter=getSelectable) BOOL selectable;
@property(nonatomic, assign, getter=getAllowsEditingTextAttributes) BOOL allowsEditingTextAttributes;
@property(nonatomic, strong, getter=getAttributedText) NSAttributedString *attributedText;
@property(nonatomic, strong, getter=getTypingAttributes) NSDictionary <NSString * , NSObject *>* typingAttributes;
@property(nonatomic, assign) NSRange scrollRangeToVisible;
@property(nonatomic, strong, getter=getTextViewInputView) UIView *textViewInputView;
@property(nonatomic, strong, getter=getTextViewInputAccessoryView) UIView *textViewInputAccessoryView;
@property(nonatomic, assign, getter=getClearsOnInsertion) BOOL clearsOnInsertion;
@property(nonatomic, strong, getter=getTextContainer) NSTextContainer *textContainer;
@property(nonatomic, assign, getter=getTextContainerInset) UIEdgeInsets textContainerInset;
@property(nonatomic, strong, getter=getLayoutManger) NSLayoutManager *layoutManger;
@property(nonatomic, strong, getter=getTextStorage) NSTextStorage *textStorage;
@property(nonatomic, strong, getter=getLinkTextAttributes) NSDictionary <NSString * , NSObject *> *linkTextAttributes;

//Private

-(void) fitToScrollView ;

@end