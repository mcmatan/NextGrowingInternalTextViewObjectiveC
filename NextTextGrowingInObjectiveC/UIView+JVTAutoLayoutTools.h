//
//  UIView+JVTAutoLayout.h
//  TeamsIntro
//
//  Created by Matan Cohen on 3/6/16.
//  Copyright © 2016 Matan Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JVTAutoLayoutTools)
#pragma mark CENTER
- (NSLayoutConstraint *)setViewCenterXEqualToViewCenterX:(UIView *)secoundView
                                                priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewCenterYEqualToViewCenterY:(UIView *)secoundView
                                                priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewCenterYEqualToViewCenterY:(UIView *)secoundView
                                                multiple:(CGFloat) multiple
                                                priority:(CGFloat)priority;
- (NSArray *)setViewCenterEqualToViewCenter:(UIView *)secoundView
                                   priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewCenterXEqualToViewCenterX:(UIView *)secoundView
                                              multipleBy:(CGFloat) multipleBy
                                                priority:(CGFloat)priority;
#pragma mark TRAILING
- (NSLayoutConstraint *)setViewTrailingEqualToViewTrailing:(UIView *)secoundView
                                                  priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewTrailingEqualToViewTrailing:(UIView *)secoundView
                                                  priority:(CGFloat)priority
                                                  constant:(CGFloat) constant;
- (NSLayoutConstraint *)setViewTrailingEqualToViewLeading:(UIView *)secoundView
                                                 priority:(CGFloat)priority
                                                 constant:(CGFloat) constant;
- (NSLayoutConstraint *)setViewTrailingLessThanOrEqualToViewTrailing:(UIView *)secoundView
                                                            priority:(CGFloat)priority
                                                                constant:(CGFloat) constant;
- (NSLayoutConstraint *)setViewTrailingLessThanOrEqualToViewLeading:(UIView *)secoundView
                                                           priority:(CGFloat)priority
                                                               constant:(CGFloat) constant;

#pragma mark - LEADING
- (NSLayoutConstraint *)setViewLeadingEqualToViewTrailing:(UIView *)secoundView
                                                 priority:(CGFloat)priority
                                                 constant:(CGFloat) constant;
- (NSLayoutConstraint *)setViewLeadingEqualToViewLeading:(UIView *)secoundView
                                                priority:(CGFloat)priority
                                                constant:(CGFloat) constant;
#pragma mark WIDTH
- (NSLayoutConstraint *)setViewWidthEqualToViewWidth:(UIView *)secoundView
                                                priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewWidthEqualToWidth:(CGFloat)width
                                            priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewWidthEqualToViewWidth:(UIView *)secoundView
                                          multipleBy:(CGFloat) multipleBy
                                            priority:(CGFloat)priority;
#pragma mark HEIGHT
- (NSLayoutConstraint *)setViewHeightEqualToHeight:(CGFloat)height
                                              priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewHeightEqualToViewHeight:(UIView *)secoundView
                                              priority:(CGFloat)priority;
- (NSLayoutConstraint *)setViewHeightEqualToViewHeight:(UIView *)secoundView
                                            multipleBy:(CGFloat) multipleBy
                                              priority:(CGFloat)priority;
#pragma mark TOP
- (NSLayoutConstraint *)setViewTopEqualToViewBottom:(UIView *)secoundView
                                           priority:(CGFloat)prioroty
                                               constant:(CGFloat)constant;
- (NSLayoutConstraint *)setViewTopEqualToViewBottom:(UIView *)secoundView
                                               priority:(CGFloat)prioroty;
- (NSLayoutConstraint *)setViewTopEqualToViewTop:(UIView *)secoundView
                                            priority:(CGFloat)prioroty;
- (NSLayoutConstraint *)setViewTopEqualToViewTop:(UIView *)secoundView
                                        priority:(CGFloat)prioroty
                                            constant:(CGFloat)constant;
#pragma mark BOTTOM
- (NSLayoutConstraint *)setViewBottomEqualToViewBottom:(UIView *)secoundView
                                              priority:(CGFloat)prioroty
                                              constant:(CGFloat)constant;
- (NSLayoutConstraint *)setViewBottomMarginEqualToMargin:(CGFloat )margin
                                                    priority:(CGFloat)prioroty;
- (NSLayoutConstraint *)setViewBottomEqualToViewTop:(UIView *)secoundView
                                           priority:(CGFloat)prioroty
                                           constant:(CGFloat)constant;
- (NSLayoutConstraint *)setViewBottomEqualToViewCenterVerticly:(UIView *)secoundView
                                                      priority:(CGFloat)prioroty
                                                      constant:(CGFloat)constant;
#pragma mark - EDGES
-(NSArray *) setViewHorizontalEdgesEquelToViewHorizintalEdges:(UIView *) secoundView
                                                      padding:(CGFloat) padding
                                                     priority:(CGFloat)prioroty;
-(NSArray *) setViewEdgesEquelToViewEdges:(UIView *) secoundView
                                  padding:(CGFloat) padding
                                 priority:(CGFloat)prioroty;
-(NSArray *) setViewEdgesEquelToViewEdges:(UIView *) secoundView
                                edgeInset:(UIEdgeInsets) edgeInset
                                 priority:(CGFloat)prioroty;
#pragma mark - ASPECT RATIO
-(NSLayoutConstraint *) setViewAspectRatioEquelTo:(CGFloat) ratio
                                EquelWithPriority:(CGFloat) priority;
@end
