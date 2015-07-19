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

- (id)initWithFrameAndVotes:(CGRect)frame objectId:(NSString *)objectId votes:(int)votes didUserVote:(BOOL)didUserVote
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pitchObjectId = objectId;
        self.numberOfVotes = votes;
        self.userVoted = didUserVote;
        self.votingEnabled = YES;
        [self baseInit];
    }
    return self;
}

-(id)initWithFrameAndVotes:(CGRect)frame objectId:(NSString *)objectId votes:(int)votes didUserVote:(BOOL)didUserVote enableVoteing:(BOOL)enableVoteing {
    self = [super initWithFrame:frame];
    if (self) {
        self.pitchObjectId = objectId;
        self.numberOfVotes = votes;
        self.userVoted = didUserVote;
        self.votingEnabled = enableVoteing;
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
    //[self.votesLabel setBackgroundColor:[UIColor colorWithWhite:0.800 alpha:1.000]];
    [self.votesLabel setBackgroundColor:[UIColor whiteColor]];
    [self.votesLabel setText:[NSString stringWithFormat:@"▲\n%d",self.numberOfVotes]];
    if (self.userVoted) {
        //[self.votesLabel setTextColor:[UIColor redColor]];
        [self.votesLabel setTextColor:[UIColor colorWithRed:0.275 green:0.604 blue:0.915 alpha:1]];
    } else {
        [self.votesLabel setTextColor:[UIColor lightGrayColor]];
    }
    [self addSubview:self.votesLabel];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    if (self.votingEnabled) {
        if ([PFUser currentUser]) {
            if (self.userVoted) {
                self.numberOfVotes--;
                self.userVoted = NO;
                [self.votesLabel setTextColor:[UIColor lightGrayColor]];
            } else {
                self.numberOfVotes++;
                self.userVoted = YES;
                //[self.votesLabel setTextColor:[UIColor redColor]];
                [self.votesLabel setTextColor:[UIColor colorWithRed:0.275 green:0.604 blue:0.915 alpha:1]];
            }
            [self.votesLabel setText:[NSString stringWithFormat:@"▲\n%d",self.numberOfVotes]];
            
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appDelegate addUpVote:self.pitchObjectId vote:self.userVoted];
            
        } else {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginRequired" object:nil];
        }
    }
}

@end
