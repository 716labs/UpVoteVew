//
//  UpVoteView.h
//  GIFpitch
//
//  Created by Karl Newell on 6/11/15.
//  Copyright (c) 2015 716 Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpVoteView : UIView

@property (nonatomic, assign) NSString* pitchObjectId;
@property (nonatomic, assign) int numberOfVotes;
@property (nonatomic, assign) BOOL userVoted;
@property (nonatomic, assign) BOOL votingEnabled;

@property (strong, nonatomic) UILabel *votesLabel;

- (id)initWithFrameAndVotes:(CGRect)frame
                   objectId:(NSString*)objectId
                      votes:(int)votes
                didUserVote:(BOOL)didUserVote;

- (id)initWithFrameAndVotes:(CGRect)frame
                   objectId:(NSString*)objectId
                      votes:(int)votes
                didUserVote:(BOOL)didUserVote
              enableVoteing:(BOOL)enableVoteing;

@end
