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

    self.textView = [[JVTNextGrowingTextView alloc] initWithFrame:CGRectMake(100, 100, 200, 35)];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.maxHeight = 300;
    self.textView.placeholderAttributedText = [[NSAttributedString alloc] initWithString:@"Hello!"];
    [self.view addSubview:self.textView];
    
    [self.textView setViewHorizontalEdgesEquelToViewHorizintalEdges:self.view padding:30 priority:600];
    [self.textView setViewBottomEqualToViewBottom:self.view priority:500 constant:-100];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
