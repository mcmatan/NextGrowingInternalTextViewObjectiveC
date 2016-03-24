//
// Created by Matan Cohen on 3/24/16.
// Copyright (c) 2016 Jive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JVTNextGrowingTextViewDelegate <NSObject>
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text ;
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange ;
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange ;
- (void)textViewDidBeginEditing:(UITextView *)textView ;
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

@property(nonatomic, strong, getter=_placeholderAttributedText) NSAttributedString *placeholderAttributedText;
@property(nonatomic, strong, getter=_text) NSString *text;
@property(nonatomic, strong, getter=font) UIFont *font;
@property(nonatomic, strong, getter=_font) UIColor *textColor;
@property(nonatomic, assign, getter=_textAlignment) NSTextAlignment textAlignment;
@property(nonatomic, assign, getter=_selectedRange) NSRange selectedRange;
@property(nonatomic, assign, getter=_dataDetectorTypes) UIDataDetectorTypes dataDetectorTypes;
@property(nonatomic, assign, getter=_selectable) BOOL selectable;
@property(nonatomic, assign, getter=_allowsEditingTextAttributes) BOOL allowsEditingTextAttributes;
@property(nonatomic, strong, getter=_attributedText) NSAttributedString *attributedText;
@property(nonatomic, strong, getter=_typingAttributes) NSDictionary <NSString * , NSObject *>* typingAttributes;
@property(nonatomic, strong, getter=_attributedTexttypingAttributes) NSString *attributedTexttypingAttributes;
@property(nonatomic, assign, getter=_scrollRangeToVisible) NSRange scrollRangeToVisible;
@property(nonatomic, strong, getter=_textViewInputView) UIView *textViewInputView;
@property(nonatomic, strong, getter=_textViewInputAccessoryView) UIView *textViewInputAccessoryView;
@property(nonatomic, assign, getter=_clearsOnInsertion) BOOL clearsOnInsertion;
@property(nonatomic, strong, getter=_NSTextContainer) NSTextContainer *textContainer;
@property(nonatomic, assign, getter=_textContainerInse) UIEdgeInsets textContainerInse;
@property(nonatomic, strong, getter=_layoutManger) NSLayoutManager *layoutManger;
@property(nonatomic, strong, getter=_textStorage) NSTextStorage *textStorage;
@property(nonatomic, strong, getter=_linkTextAttributes) NSDictionary <NSString * , NSObject *> *linkTextAttributes;

//Private

-(void) fitToScrollView ;

@end