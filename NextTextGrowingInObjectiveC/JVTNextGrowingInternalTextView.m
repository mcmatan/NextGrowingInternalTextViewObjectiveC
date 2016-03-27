//
// Created by Matan Cohen on 3/24/16.
// Copyright (c) 2016 Jive. All rights reserved.
//

#import "JVTNextGrowingInternalTextView.h"


@implementation JVTNextGrowingInternalTextView {

}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    [self updatePlaceHolder];
}

-(void)setPlaceholderAttributedText:(NSAttributedString *)placeholderAttributedText {
    _placeholderAttributedText = placeholderAttributedText;
    [self setNeedsDisplay];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    if (self.displayPlaceholder) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = self.textAlignment;

//        CGRect targetRect = CGRectMake(5, 8 + self.contentInset.top, self.frame.size.width - self.contentInset.left, self.frame.size.height - self.contentInset.top);

        //MC CHANGE
        CGRect targetRect = CGRectMake(5, self.textContainerInset.top, self.frame.size.width - self.contentInset.left, self.frame.size.height - self.contentInset.top);

        NSAttributedString *attributedString = self.placeholderAttributedText;
        [attributedString drawInRect:targetRect];
    }
}

-(void)setDisplayPlaceholder:(BOOL)displayPlaceholder {
    BOOL didChange = _displayPlaceholder != displayPlaceholder;
    _displayPlaceholder = displayPlaceholder;
    if (didChange) {
        [self setNeedsDisplay];
    }
}

-(void) textDidChangeNotification:(NSNotification *) notification {
    [self updatePlaceHolder];
}

-(void) updatePlaceHolder {
    self.displayPlaceholder = self.text.length == 0;
}
@end