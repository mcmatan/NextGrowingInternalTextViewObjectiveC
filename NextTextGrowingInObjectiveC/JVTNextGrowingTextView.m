//
// Created by Matan Cohen on 3/24/16.
// Copyright (c) 2016 Jive. All rights reserved.
//

#import "JVTNextGrowingTextView.h"
#import "JVTNextGrowingInternalTextView.h"


@interface JVTNextGrowingTextView () <UITextViewDelegate> {}
@property (nonatomic, strong) JVTNextGrowingInternalTextView *textView;

@property (nonatomic,assign) CGRect previousFrame;
@end

@implementation JVTNextGrowingTextView {

}

@synthesize allowsEditingTextAttributes = _allowsEditingTextAttributes;
@synthesize placeholderAttributedText = _placeholderAttributedText;
@synthesize text = _text;
@synthesize font = _font;
@synthesize textColor = _textColor;
@synthesize textAlignment = _textAlignment;
@synthesize selectedRange = _selectedRange;
@synthesize dataDetectorTypes = _dataDetectorTypes;
@synthesize selectable = _selectable;
@synthesize attributedText = _attributedText;
@synthesize typingAttributes = _typingAttributes;
@synthesize scrollRangeToVisible = _scrollRangeToVisible;
@synthesize textViewInputView = _textViewInputView;
@synthesize textViewInputAccessoryView = _textViewInputAccessoryView;
@synthesize clearsOnInsertion = _clearsOnInsertion;
@synthesize textContainer = _textContainer;
@synthesize textContainerInset = _textContainerInset;
@synthesize layoutManger = _layoutManger;
@synthesize textStorage = _textStorage;
@synthesize linkTextAttributes = _linkTextAttributes;



-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JVTNextGrowingInternalTextView *textView = [[JVTNextGrowingInternalTextView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.textView = textView;
        self.previousFrame = frame;
        _maxNumberOfLines = 0;
        _minNumberOfLines = 0;
        _maxHeight = 0;
        _minHeight = 0;
        
        [self setup];
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        JVTNextGrowingInternalTextView *textView = [[JVTNextGrowingInternalTextView alloc] initWithFrame:CGRectZero];
        self.textView = textView;
        textView.frame = self.bounds;
        self.previousFrame = self.frame;
        [self setup];
    }
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    if (self.previousFrame.size.width != self.bounds.size.width) {
        self.previousFrame = self.frame;
        [self fitToScrollView];
    }
}

-(void) setup {
    self.textView.delegate = self;
    self.textView.scrollEnabled = false;
    self.textView.font = [UIFont systemFontOfSize:16];
    self.textView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.textView];
    self.minHeight = self.frame.size.height;
    self.maxNumberOfLines = 3;
    self.bounces = NO;
}

-(void)setMinNumberOfLines:(int)minNumberOfLines {
    if (!minNumberOfLines > 0) {
        self.minHeight = 0;
        return;
    }
    self.minHeight = [self simulateHeight:minNumberOfLines];
    _minNumberOfLines = minNumberOfLines;
    
}


-(void) setMaxNumberOfLines:(int)maxNumberOfLines {
    if (!maxNumberOfLines > 0) {
        self.maxNumberOfLines = 0;
        return;
    }
    self.maxHeight = [self simulateHeight:maxNumberOfLines];
    _maxNumberOfLines = maxNumberOfLines;
}

-(int) simulateHeight: (int) line {
    NSString *savedText = self.textView.text;
    NSString *nextText = @"-";
    
    self.textView.delegate = nil;
    self.textView.hidden = YES;
    
    for (int i = 0; i < line; i ++) {
        nextText = [NSString stringWithFormat:@"%@%@", nextText, @"\n|W|"];
    }
    
    self.textView.text = nextText;
    
    CGFloat textViewMargin = 16;
    CGFloat height = [self measureTextViewSize].height - (textViewMargin + self.textView.contentInset.top + self.textView.contentInset.bottom);
    
    self.textView.text = savedText;
    self.textView.hidden = NO;
    self.textView.delegate = self;
    
    return height;
    
}

-(CGSize) measureTextViewSize {
    return [self.textView sizeThatFits:CGSizeMake(self.bounds.size.width, self.bounds.size.height)];
}

-(CGRect) measureFrame:(CGSize) contentSize {
    
    CGSize selfSize = CGSizeZero;
    
    if (contentSize.height < self.minHeight || !self.textView.hasText) {
        selfSize = CGSizeMake(contentSize.width, self.minHeight);
    } else if (self.maxHeight > 0 && contentSize.height > self.maxHeight) {
        selfSize = CGSizeMake(contentSize.width, self.maxHeight);
    } else {
        selfSize = contentSize;
    }
    
    CGRect frame = self.frame;
    frame.size.height = selfSize.height;
    return frame;
}

-(void) fitToScrollView {
    
    BOOL scrollToBottom = self.contentOffset.y == self.contentSize.height - self.frame.size.height;
    CGSize actualTextViewSize = [self measureTextViewSize];
    CGRect oldScrollViewFrame = self.frame;
    
    CGRect frame = self.bounds;
    frame.origin = CGPointZero;
    frame.size.height = actualTextViewSize.height;
    self.textView.frame = frame;
    self.contentSize = frame.size;
    
    CGRect newScrollViewFrame = [self measureFrame:actualTextViewSize];
    
    if (oldScrollViewFrame.size.height != newScrollViewFrame.size.height && newScrollViewFrame.size.height <= self.maxHeight) {
        [self flashScrollIndicators];
        if (self.delegates && [self.delegates respondsToSelector:@selector(willChangeHeight:)]) {
                    [self.delegates willChangeHeight:newScrollViewFrame.size.height];
        }
    }
    
    self.frame = newScrollViewFrame;
    
    if (scrollToBottom) {
        [self scrollToBottom];
    }
    
    if (self.delegates && [self.delegates respondsToSelector:@selector(didChangeHeight:)]) {
            [self.delegates didChangeHeight:self.frame.size.height];
    }
    
    [self invalidateIntrinsicContentSize];
    
}

-(void) scrollToBottom{
    CGPoint offset = self.contentOffset;
    self.contentOffset = CGPointMake(offset.x, self.contentSize.height - self.frame.size.height);
}

#pragma mark - UIResponder

-(UIView *) inputView {
    return self.textView.inputView;
}

-(void) setInputView:(UIView *)inputView {
    self.textView.inputView = inputView;
}

-(BOOL) isFirstResponder {
    return [self.textView isFirstResponder];
}

-(BOOL) becomeFirstResponder {
    return [self.textView becomeFirstResponder];
}

-(BOOL) resignFirstResponder {
    return [self.textView resignFirstResponder];
}

-(CGSize) intrinsicContentSize {
    return [self measureFrame:[self measureTextViewSize]].size;
}

#pragma mark - Getters and setters

-(void)setPlaceholderAttributedText:(NSAttributedString *)placeholderAttributedText {
    self.textView.placeholderAttributedText = placeholderAttributedText;
}

-(NSAttributedString *)getPlaceholderAttributedText {
    return self.textView.placeholderAttributedText;
}

-(void)setText:(NSString *)text {
    self.textView.text = text;
    [self fitToScrollView];
}

-(NSString *) getText {
    return self.textView.text;
}

-(UIFont *) getFont {
    return self.textView.font;
}

-(void)setFont:(UIFont *)font {
    self.textView.font = font;
}

-(void)setTextColor:(UIColor *)textColor {
    self.textView.textColor = textColor;
}

-(UIColor *) getTextColor {
    return self.textView.textColor;
}

-(NSTextAlignment) getTextAlignment {
    return self.textView.textAlignment;
}

-(void)setTextAlignment:(NSTextAlignment)textAlignment {
    self.textView.textAlignment = textAlignment;
}

-(void)setSelectedRange:(NSRange)selectedRange {
    self.textView.selectedRange = selectedRange;
}

-(NSRange) getSelectedRange {
    return self.textView.selectedRange;
}

-(void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes {
    self.textView.dataDetectorTypes = dataDetectorTypes;
}

-(UIDataDetectorTypes) getDataDetectorTypes {
    return self.textView.dataDetectorTypes;
}

-(void)setSelectable:(BOOL)selectable {
    self.textView.selectable = selectable;
}

-(BOOL) getSelectable {
    return self.textView.selectable;
}

-(void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes {
    _allowsEditingTextAttributes = allowsEditingTextAttributes;
}

-(BOOL)getAllowsEditingTextAttributes {
    return self.allowsEditingTextAttributes;
}

-(void)setAttributedText:(NSAttributedString *)attributedText {
    _attributedText = attributedText;
    [self fitToScrollView];
}

-(NSAttributedString *) getAttributedText {
    return self.textView.attributedText;
}

-(void)setTypingAttributes:(NSDictionary *)typingAttributes {
    _typingAttributes = typingAttributes;
}

-(NSDictionary *) getTypingAttributes {
    return _typingAttributes;
}

-(void)setScrollRangeToVisible:(NSRange)scrollRangeToVisible {
    [self.textView scrollRangeToVisible:scrollRangeToVisible];
}

-(void)setTextViewInputView:(UIView *)textViewInputView {
    self.textView.inputView = textViewInputView;
}

-(UIView *)getTextViewInputView {
    return self.textView.inputView;
}

-(void)setTextViewInputAccessoryView:(UIView *)textViewInputAccessoryView {
    self.textView.inputAccessoryView = textViewInputAccessoryView;
}

-(UIView *)getTextViewInputAccessoryView {
   return self.textView.inputAccessoryView;
}

-(void)setClearsOnInsertion:(BOOL)clearsOnInsertion {
    self.textView.clearsOnInsertion = clearsOnInsertion;
}
-(BOOL) getClearsOnInsertion {
    return self.textView.clearsOnInsertion;
}

-(NSTextContainer *) getTextContainer {
    return self.textView.textContainer;
}

-(void)setTextContainerInset:(UIEdgeInsets)textContainerInset {
    self.textView.textContainerInset = textContainerInset;
}

-(UIEdgeInsets) getTextContainerInset {
    return self.textView.textContainerInset;
}

-(NSLayoutManager *) getLayoutManger {
    return self.textView.layoutManager;
}

-(NSTextStorage *) getTextStorage {
    return self.textView.textStorage;
}

-(void)setLinkTextAttributes:(NSDictionary *)linkTextAttributes {
    self.textView.linkTextAttributes = linkTextAttributes;
}

-(NSDictionary  *) getLinkTextAttributes {
    return self.textView.linkTextAttributes;
}

@end