//
//  ViewController.m
//  UpVoteViewTest
//
//  Created by Karl Newell on 7/19/15.
//  Copyright (c) 2015 716 Labs. All rights reserved.
//

#import "ViewController.h"

#import "UpVoteView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UpVoteView *upVoteView = [[UpVoteView alloc] initWithFrameAndVotes:CGRectMake(50, 50, 40, 50)
                                                                 votes:20
                                                           didUserVote:NO];
    [self.view addSubview:upVoteView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
