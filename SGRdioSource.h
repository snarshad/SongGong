//
//  SGRdioSource.h
//  SongGong
//
//  Created by Daniel DeCovnick on 7/17/11.
//

#import <Foundation/Foundation.h>
#import "SGSourceProtocols.h"

@interface SGRdioSource : NSObject <SGSource>
@end


@interface SGRdioItem : NSObject <SGMediaItem>
@end

@interface SGRdioPlaylist : NSObject <SGMediaPlaylist>
@end



