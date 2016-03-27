//
//  ViewController.m
//  NextTextGrowingInObjectiveC
//
//  Created by Matan Cohen on 3/24/16.
//  Copyright © 2016 Matan Cohen. All rights reserved.
//

#import "ViewController.h"
#import "JVTNextGrowingTextView.h"
#import "UIView+JVTAutoLayoutTools.h"

@interface ViewController ()
@property (nonatomic,strong) JVTNextGrowingTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textView = [[JVTNextGrowingTextView alloc] initWithFrame:CGRectMake(100, 100, 200, 27.5)];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.font = [UIFont systemFontOfSize:18 weight:UIFontWeightRegular];
    self.textView.textContainerInset = UIEdgeInsetsMake(2.5, 0, 3, 0);
    self.textView.placeholderAttributedText = [self placeHolder];    
    [self.view addSubview:self.textView];
    
    [self.textView setViewHorizontalEdgesEquelToViewHorizintalEdges:self.view padding:30 priority:600];
    [self.textView setViewBottomEqualToViewBottom:self.view priority:500 constant:-100];

}

-(NSAttributedString *) placeHolder {
    UIFont *systemFont = [UIFont systemFontOfSize:18.0f];
    NSDictionary * fontAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:systemFont, NSFontAttributeName, nil];
    NSMutableAttributedString *libTitle = [[NSMutableAttributedString alloc] initWithString:@"Library" attributes:fontAttributes];
    
    return libTitle;
}

@end
