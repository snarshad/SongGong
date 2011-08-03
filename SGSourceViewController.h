//
//  SGSourceViewController.h
//  SongGong
//
//  Created by Arshad Tayyeb on 7/31/11.
//  Copyright 2011  Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGSourceProtocols.h"
#import "SGGenericPlayerView.h"

@interface SGSourceViewController : UIViewController <SGSourceViewController, SGSourceDelegate>
{
    id<SGSource> source;
    IBOutlet UIImageView *artworkOrIcon;
    IBOutlet UILabel *playlistNameLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *artistLabel;
    IBOutlet UILabel *myPlaylistsLabel;
    BOOL iconMode;
    NSTimer *switchToPlayerViewTimer;
    SGGenericPlayerView *playerViewController;
    CGRect origPlaylistNameLabelFrame;
    UIView *topView;
    UIView *bottomView;
}

@property (nonatomic, retain) IBOutlet UIView *bottomView;
@property (nonatomic, retain) IBOutlet UIView *topView;
@property (nonatomic, retain) IBOutlet UIView *colorSplash;

@end
