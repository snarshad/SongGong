//
//  SGIPodSource.h
//  SongGong
//
//  Created by Arshad Tayyeb on 7/16/11.
//

#import <Foundation/Foundation.h>
#import "SGSourceProtocols.h"

@class MPMusicPlayerController;

@interface SGIPodSource : NSObject <SGSource>

@end

@interface SGIPodPlaylist : NSObject <SGMediaPlaylist>
- (id <SGMediaItem>)previousItem;
- (id <SGMediaItem>)nextItem;
- (void)playItem:(id <SGMediaItem>)item;
@property (readwrite, retain) NSString *title;
@property (readwrite, retain) id <SGMediaItem> currentItem;
@property (readwrite, retain) NSArray *itemIds;
@property (readwrite, retain) NSString *persistentId;
@end



@interface SGIPodItem : NSObject <SGMediaItem>
- (void)togglePlay:(id)sender;
@property (readwrite, retain) MPMusicPlayerController *player;
@property (readwrite, retain) NSTimer *updateTimer;
@property (readonly) UIImage *thumbnail;
@property (readwrite, retain) NSString *title;
@property (readwrite, retain) NSString *album;
@property (readwrite, retain) NSString *artist;
@property (readwrite, retain) NSString *persistentId;
- (void) playbackStateChanged:(id)notification;
@end
