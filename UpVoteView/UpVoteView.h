//
//  UpVoteView.h
//
//  Created by Karl Newell on 6/11/15.
//  Copyright (c) 2015 716 Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpVoteView : UIView

@property (nonatomic, assign) int numberOfVotes;
@property (nonatomic, assign) BOOL voted;

@property (strong, nonatomic) UILabel *votesLabel;

- (id)initWithFrameAndVotes:(CGRect)frame votes:(int)votes didUserVote:(BOOL)voted;

@end
