//
//  UIView+JVTAutoLayout.m
//  TeamsIntro
//
//  Created by Matan Cohen on 3/6/16.
//  Copyright © 2016 Matan Cohen. All rights reserved.
//

#import "UIView+JVTAutoLayoutTools.h"

@implementation UIView (JVTAutoLayoutTools)


//Center

- (NSLayoutConstraint *)setViewCenterXEqualToViewCenterX:(UIView *)secoundView
                              priority:(CGFloat)priority {
    return [self setViewCenterXEqualToViewCenterX:secoundView multipleBy:1.0 priority:priority];
}

- (NSLayoutConstraint *)setViewCenterXEqualToViewCenterX:(UIView *)secoundView
                                              multipleBy:(CGFloat) multipleBy
                                                priority:(CGFloat)priority {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:multipleBy
                                                                        constant:0];
    heightConstrain.priority = priority;
    
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewCenterYEqualToViewCenterY:(UIView *)secoundView
                                                priority:(CGFloat)priority {
    return [self setViewCenterYEqualToViewCenterY:secoundView multiple:1.0 priority:priority];
}

- (NSLayoutConstraint *)setViewCenterYEqualToViewCenterY:(UIView *)secoundView
                                                multiple:(CGFloat) multiple
                                                priority:(CGFloat)priority {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeCenterY
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeCenterY
                                                                      multiplier:multiple
                                                                        constant:0];
    heightConstrain.priority = priority;
    
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSArray *)setViewCenterEqualToViewCenter:(UIView *)secoundView
                                                priority:(CGFloat)priority {
  
    return @[[self setViewCenterXEqualToViewCenterX:secoundView priority:priority], [self setViewCenterYEqualToViewCenterY:secoundView priority:priority]];
}

//Trailing

- (NSLayoutConstraint *)setViewTrailingEqualToViewTrailing:(UIView *)secoundView
                               priority:(CGFloat)priority {
    return [self setViewTrailingEqualToViewTrailing:secoundView priority:priority constant:0];
}

- (NSLayoutConstraint *)setViewTrailingEqualToViewTrailing:(UIView *)secoundView
                               priority:(CGFloat)priority
                               constant:(CGFloat) constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0
                                                                        constant:constant];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewTrailingEqualToViewLeading:(UIView *)secoundView
                               priority:(CGFloat)priority
                               constant:(CGFloat) constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0
                                                                        constant:constant];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewTrailingLessThanOrEqualToViewTrailing:(UIView *)secoundView
                               priority:(CGFloat)priority
                               constant:(CGFloat) constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationLessThanOrEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0
                                                                        constant:constant];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewTrailingLessThanOrEqualToViewLeading:(UIView *)secoundView
                               priority:(CGFloat)priority
                               constant:(CGFloat) constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationLessThanOrEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0
                                                                        constant:constant];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

//LEADING

- (NSLayoutConstraint *)setViewLeadingEqualToViewTrailing:(UIView *)secoundView
                                                  priority:(CGFloat)priority
                                                  constant:(CGFloat) constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeLeading
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0
                                                                        constant:constant];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewLeadingEqualToViewLeading:(UIView *)secoundView
                                                  priority:(CGFloat)priority
                                                  constant:(CGFloat) constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeLeading
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0
                                                                        constant:constant];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

//WIDTH

- (NSLayoutConstraint *)setViewWidthEqualToViewWidth:(UIView *)secoundView
                            priority:(CGFloat)priority {
    return [self setViewWidthEqualToViewWidth:secoundView multipleBy:1.0 priority:priority];
}

- (NSLayoutConstraint *)setViewWidthEqualToViewWidth:(UIView *)secoundView
                                          multipleBy:(CGFloat) multipleBy
                                            priority:(CGFloat)priority {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:multipleBy
                                                                        constant:0];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewWidthEqualToWidth:(CGFloat)width
                            priority:(CGFloat)priority {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *widthConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1.0
                                                                       constant:width];
    widthConstrain.priority = priority;
    [self addConstraint:widthConstrain];
    return widthConstrain;
}


//HEIGHT
- (NSLayoutConstraint *)setViewHeightEqualToHeight:(CGFloat)height
                             priority:(CGFloat)priority {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:height];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain];
    return heightConstrain;
}

- (NSLayoutConstraint *)setViewHeightEqualToViewHeight:(UIView *)secoundView
                                              priority:(CGFloat)priority {
    return [self setViewHeightEqualToViewHeight:secoundView multipleBy:1.0 priority:priority];
}

- (NSLayoutConstraint *)setViewHeightEqualToViewHeight:(UIView *)secoundView
                                            multipleBy:(CGFloat) multipleBy
                                            priority:(CGFloat)priority {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:secoundView
                                                                       attribute:NSLayoutAttributeHeight
                                                                      multiplier:multipleBy
                                                                        constant:0];
    heightConstrain.priority = priority;
    [self addConstraint:heightConstrain ForViews:self secoundView:secoundView];
    return heightConstrain;
}

//TOP
- (NSLayoutConstraint *)setViewTopEqualToViewBottom:(UIView *)secoundView
                          priority:(CGFloat)prioroty
                          constant:(CGFloat)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constrain = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:secoundView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:constant];
    
    [self addConstraint:constrain ForViews:self secoundView:secoundView];
    return constrain;
}

- (NSLayoutConstraint *)setViewTopEqualToViewBottom:(UIView *)secoundView
                          priority:(CGFloat)prioroty {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [self setViewTopEqualToViewBottom:secoundView priority:prioroty constant:0];
}

- (NSLayoutConstraint *)setViewTopEqualToViewTop:(UIView *)secoundView
                          priority:(CGFloat)prioroty {
    return [self setViewTopEqualToViewTop:secoundView priority:prioroty constant:0];
}

- (NSLayoutConstraint *)setViewTopEqualToViewTop:(UIView *)secoundView
                          priority:(CGFloat)prioroty
                          constant:(CGFloat)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constrain = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:secoundView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:constant];
    [self addConstraint:constrain ForViews:self secoundView:secoundView];
    return constrain;
}

//BOTTOM

- (NSLayoutConstraint *)setViewBottomEqualToViewBottom:(UIView *)secoundView
                             priority:(CGFloat)prioroty
                             constant:(CGFloat)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constrain = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:secoundView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:constant];
    [self addConstraint:constrain ForViews:self secoundView:secoundView];
    return constrain;
}

- (NSLayoutConstraint *)setViewBottomEqualToViewTop:(UIView *)secoundView
                                              priority:(CGFloat)prioroty
                                              constant:(CGFloat)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constrain = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:secoundView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:constant];
    [self addConstraint:constrain ForViews:self secoundView:secoundView];
    return constrain;
}

- (NSLayoutConstraint *)setViewBottomEqualToViewCenterVerticly:(UIView *)secoundView
                                           priority:(CGFloat)prioroty
                                           constant:(CGFloat)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constrain = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:secoundView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:constant];
    [self addConstraint:constrain ForViews:self secoundView:secoundView];
    return constrain;
}

- (NSLayoutConstraint *)setViewBottomMarginEqualToMargin:(CGFloat )margin
                                   priority:(CGFloat)prioroty  {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constrain = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeBottomMargin
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:margin];
    
    [self addConstraint:constrain];
    return constrain;
}


#pragma mark - EDGES
-(NSArray *) setViewHorizontalEdgesEquelToViewHorizintalEdges:(UIView *) secoundView
                                                      padding:(CGFloat) padding
                                                     priority:(CGFloat)priority {
    
    NSLayoutConstraint *trailingConstraint = [self setViewTrailingEqualToViewTrailing:secoundView priority:priority constant:-padding];
    NSLayoutConstraint *leadingConstraint = [self setViewLeadingEqualToViewLeading:secoundView priority:priority constant:padding];
    
    return @[trailingConstraint, leadingConstraint];
}

-(NSArray *) setViewEdgesEquelToViewEdges:(UIView *) secoundView
                                        padding:(CGFloat) padding
                                        priority:(CGFloat)prioroty {
    return @[
             [self setViewLeadingEqualToViewLeading:secoundView priority:prioroty constant:padding],
             [self setViewTrailingEqualToViewTrailing:secoundView priority:prioroty constant:-padding],
             [self setViewTopEqualToViewTop:secoundView priority:prioroty constant:padding],
             [self setViewBottomEqualToViewBottom:secoundView priority:prioroty constant:-padding]
             ];
}

-(NSArray *) setViewEdgesEquelToViewEdges:(UIView *) secoundView
                                  edgeInset:(UIEdgeInsets) edgeInset
                                 priority:(CGFloat)prioroty {
    return @[
             [self setViewLeadingEqualToViewLeading:secoundView priority:prioroty constant:edgeInset.left],
             [self setViewTrailingEqualToViewTrailing:secoundView priority:prioroty constant:-edgeInset.right],
             [self setViewTopEqualToViewTop:secoundView priority:prioroty constant:edgeInset.top],
             [self setViewBottomEqualToViewBottom:secoundView priority:prioroty constant:-edgeInset.bottom]
             ];
}

#pragma mark - ASPECT RASIO

-(NSLayoutConstraint *) setViewAspectRatioEquelTo:(CGFloat) ratio
                         EquelWithPriority:(CGFloat) priority {
    NSLayoutConstraint *constraint = [NSLayoutConstraint
                                      constraintWithItem:self
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self
                                      attribute:NSLayoutAttributeHeight
                                      multiplier:ratio
                                      constant:0];
    constraint.priority = priority;
    [self addConstraint:constraint];
    return constraint;
}

#pragma mark - Helpers

-(void) addConstraint:(NSLayoutConstraint *) constraint
             ForViews:(UIView *) firstView
          secoundView:(UIView *) secoundView {
    if ([firstView isDescendantOfView:secoundView]) {
        [secoundView addConstraint:constraint];
        return;
    }
    if ([secoundView isDescendantOfView:firstView]) {
        [firstView addConstraint:constraint];
        return;
    }
    
    UIView *commonSuperView = [self nearestCommonSuperviewWithOtherView:secoundView];
    if (!commonSuperView) {
        NSString *reasonString = [NSString stringWithFormat:@"%@ %@", firstView, secoundView];
        @throw [[NSException alloc] initWithName:@"Views are not in hierarchy" reason:reasonString userInfo:nil];
    } else {
        [commonSuperView addConstraint:constraint];
    }
    
}

+ (NSArray *)hierarchyForView:(UIView *)view accumulator:(NSArray *)accumulator
{
    if (!view) {
        return accumulator;
    }
    else {
        return [self.class hierarchyForView:view.superview accumulator:[accumulator arrayByAddingObject:view]];
    }
}

- (NSArray *)viewHierarchy
{
    return [self.class hierarchyForView:self accumulator:@[]];
}

- (UIView *)nearestCommonSuperviewWithOtherView:(UIView *)otherView
{
    return [[self viewHierarchy] firstObjectCommonWithArray:[otherView viewHierarchy]];
}

@end
