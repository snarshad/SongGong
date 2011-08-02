//
//  SGSource.m
//  SongGong
//
//  Created by Arshad Tayyeb on 7/17/11.
//  Copyright 2011  Corporation. All rights reserved.
//

#import "SGSource.h"

@implementation SGSource
@synthesize playlists, sourceName, currentPlaylist, currentItem, splashColor, delegate;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -

- (void)play:(id)sender
{
    
}

- (void)togglePlay:(id)sender
{
    
}


- (void)stop:(id)sender
{
    
}
#pragma mark -

- (void)playNextPlaylist
{
    
}

- (void)playPreviousPlaylist
{
    
}
#pragma mark -
- (void)playNextItem
{
    
}

- (void)playPreviousItem
{
    
}

#pragma mark Might not be necessary
- (id <SGMediaPlaylist>)previousPlaylist
{
    return nil;
}


- (id <SGMediaPlaylist>)nextPlaylist
{
    return nil;    
}

@end



