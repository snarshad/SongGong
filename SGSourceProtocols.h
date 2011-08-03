//
//  SGSourceProtocols.h
//  SongGong
//
//  Created by Daniel DeCovnick on 7/16/11.
//

#import <Foundation/Foundation.h>

@protocol SGMediaItem, SGMediaPlaylist, SGSource, SGSourceDelegate;

@protocol SGSourceViewController <NSObject>
@property (readwrite, retain) id <SGSource> source;
@property (readonly, retain) UIView *carouselDisplayView;
@optional
-(void)carouselWillBringViewToFront;
-(void)carouselWillSendViewToBack;
-(void)carouselDidSendViewToBack;
-(void)carouselDidBringViewToFront;
-(void)popGenericPlayer;
@end

@protocol SGSource <NSObject>
- (void)togglePlay:(id)sender;
- (void)play:(id)sender;
- (void)stop:(id)sender;

- (void)playNextItem;
- (void)playPreviousItem;

- (void)playPreviousPlaylist;
- (void)playNextPlaylist;

- (id <SGMediaPlaylist>)previousPlaylist;
- (id <SGMediaPlaylist>)nextPlaylist;
@property (readwrite, retain) id <SGMediaItem> currentItem;
@property (readwrite, retain) NSString *sourceName;
@property (nonatomic, retain) id <SGMediaPlaylist> currentPlaylist;
@property (readwrite, retain) NSArray *playlists;
@property (readwrite, retain) UIColor *splashColor;
@property (readwrite, assign) id<SGSourceDelegate> delegate;
@end

@protocol SGMediaItem <NSObject>

- (void)togglePlay:(id)sender;
@property (readonly) UIImage *thumbnail;
@property (readwrite, retain) NSString *title;
@property (readwrite, retain) NSString *album;
@property (readwrite, retain) NSString *artist;
@property (readonly, assign) float progress;

@end

@protocol SGMediaPlaylist <NSObject>

- (id <SGMediaItem>)previousItem;
- (id <SGMediaItem>)nextItem;
- (void)playItem:(id <SGMediaItem>)item;
@property (readwrite, retain) NSString *title;
@property (readwrite, retain) id <SGMediaItem> currentItem;

@end

@protocol SGSourceDelegate <NSObject>

- (void)playlistWillChange:(NSString *)newPlaylistName direction:(int)direction;
- (void)mediaDidChange:(id <SGMediaItem>)media;

@end