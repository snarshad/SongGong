//
//  SGIPodSourceViewController.m
//  SongGong
//

#import "SGIPodSourceViewController.h"
#import "SGGenericPlayerView.h"
#import "SGIPodSource.h"
#import "SGCarouselProtocols.h"
#import "ExplodingTextViewController.h"
#import "SongGongAppDelegate.h"

@interface SGIPodSourceViewController ()
@end


@implementation SGIPodSourceViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        source = [[SGIPodSource alloc] init];
        source.delegate = self;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark SGCarouselViewController Protocol


// show different image if carousel goes to back
-(void)carouselDidSendViewToBack
{
    artworkOrIcon.image = [UIImage imageNamed:@"mainicons_r_2"];
    [super carouselDidSendViewToBack];
}

- (void)dealloc 
{
    [super dealloc];
}

#pragma mark delegate methods
//0 = up, 1 = down
- (void)playlistWillChange:(NSString *)newPlaylistName direction:(int)direction
{
    if (!newPlaylistName)
        newPlaylistName = @"Library";
    [super playlistWillChange:newPlaylistName direction:direction];
}

@end
