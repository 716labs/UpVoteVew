//
//  UpVoteView.m
//  GIFpitch
//
//  Created by Karl Newell on 6/11/15.
//  Copyright (c) 2015 716 Labs. All rights reserved.
//

#import "UpVoteView.h"
#import "AppDelegate.h"

@implementation UpVoteView

-(id)initWithFrameAndVotes:(CGRect)frame votes:(int)votes didUserVote:(BOOL)voted
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfVotes = votes;
        self.voted = voted;
        [self baseInit];
    }
    return self;
}

- (void)baseInit
{
    self.layer.cornerRadius = 5.0;
    
    self.votesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height)];
    [self.votesLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0]];
    self.votesLabel.clipsToBounds = YES;
    self.votesLabel.layer.cornerRadius = 5.0;
    [self.votesLabel setNumberOfLines:0];
    [self.votesLabel setTextAlignment:NSTextAlignmentCenter];
    [self.votesLabel setLineBreakMode:NSLineBreakByWordWrapping];

    [self.votesLabel setBackgroundColor:[UIColor lightGrayColor]];
    [self.votesLabel setText:[NSString stringWithFormat:@"▲\n%d",self.numberOfVotes]];

    if (self.voted) {
        [self.votesLabel setTextColor:[UIColor redColor]];
    } else {
        [self.votesLabel setTextColor:[UIColor whiteColor]];
    }
    
    [self addSubview:self.votesLabel];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    if (self.voted) {
        self.numberOfVotes--;
        self.voted = NO;
        [self.votesLabel setTextColor:[UIColor whiteColor]];
    } else {
        self.numberOfVotes++;
        self.voted = YES;

        [self.votesLabel setTextColor:[UIColor redColor]];
    }
    [self.votesLabel setText:[NSString stringWithFormat:@"▲\n%d",self.numberOfVotes]];
    
            
}

@end
