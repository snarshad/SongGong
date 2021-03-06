//
//  SGGenericPlayerView.m
//  SongGong
//
//  Created by Daniel DeCovnick on 7/16/11.
//

#import "SGGenericPlayerView.h"
#import "OHAttributedLabel.h"
#import "SGSourceProtocols.h"
#import "NSAttributedString+Attributes.h"
#import "NSObject+SPInvocationGrabbing.h"
#import "DDProgressView.h"

@implementation SGGenericPlayerView
@synthesize songProgress;
@synthesize topView;
@synthesize listeningToLabel;
@synthesize colorSplashView;
@synthesize artworkView;
@synthesize attributedLabel;
@synthesize playItem;
@synthesize source;
@synthesize progressTimer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setPlayItem:(NSObject<SGMediaItem> *)aPlayItem
{
    if (aPlayItem == playItem)
        return;
    if (aPlayItem != nil && progressTimer == nil)
    {
        self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgress:) userInfo:0 repeats:YES];
    } else if (aPlayItem == nil) {
        [progressTimer invalidate];
        self.progressTimer  = nil;

    }
    
    [self willChangeValueForKey:@"playItem"];
    if (playItem != aPlayItem)
    {
        [aPlayItem retain];
        [(NSObject<SGSource>*)playItem release];
        playItem = aPlayItem;
    }

        
    listeningToLabel.text = self.source.sourceName;
    colorSplashView.backgroundColor = self.source.splashColor;

    NSString *title = playItem.title;
    NSString *artist = playItem.artist;
    NSString *album = playItem.album;
    if (!(title && artist && album))
        return;
    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] initWithString:[title stringByAppendingFormat:@"\n%@\n%@", artist, album]];
    [mas setTextColor:[UIColor colorWithRed:140.0/255.0 green:198.0/255.0 blue:63.0/255.0 alpha:1.0] range:NSMakeRange(0, title.length)];
    [mas setFontFamily:@"Helvetica" size:20.0 bold:YES italic:NO range:NSMakeRange(0, title.length)];
    [mas setTextColor:[UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0] range:NSMakeRange(title.length+1, artist.length)];
    [mas setFontFamily:@"Helvetica" size:17.0 bold:YES italic:NO range:NSMakeRange(title.length+1, artist.length)];
    [mas setTextColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0] range:NSMakeRange(title.length+2+artist.length, album.length)];
    [mas setFontFamily:@"Helvetica" size:17.0 bold:YES italic:NO range:NSMakeRange(title.length+2+artist.length, album.length)];
    attributedLabel.attributedText = mas;
    [mas release];
    songProgress.progress = playItem.progress;
    
    [(NSObject *)playItem addObserver:self forKeyPath:@"progress" options:0 context:nil];
    
    artworkView.image = playItem.thumbnail ? playItem.thumbnail : [UIImage imageNamed:@"BlankAudio"];
    [self.view setNeedsDisplay];
    [self didChangeValueForKey:@"playItem"];
}

- (void)updateProgress:(id)obj
{
//    [[songProgress onMainAsync:YES] setProgress:(float)playItem.progress];
//    NSLog(@"%02f, %2f", songProgress.progress, (float)playItem.progress);
//    [songProgress setNeedsDisplay];
    betterProgressView.progress = (float)playItem.progress;
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
    
    
    CGRect progressFrame = self.songProgress.frame;
    betterProgressView = [[DDProgressView alloc] initWithFrame:progressFrame];
    
    betterProgressView.innerColor = [UIColor colorWithRed:140.0/255.0 green:198.0/255.0 blue:63.0/255.0 alpha:1.0];
    
    betterProgressView.outerColor = [UIColor colorWithRed:140.0/255.0 green:198.0/255.0 blue:63.0/255.0 alpha:1.0];
    betterProgressView.emptyColor = [UIColor blackColor];
    
    UIView *sv = self.songProgress.superview;
    [songProgress removeFromSuperview];
    [sv addSubview:betterProgressView];
  //  [betterProgressView release];
    
    // Do any additional setup after loading the view from its nib.
    [topView setBackgroundColor:[[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"gray_bar_gradient"]] autorelease]];
    
    
//    NSString *title = playItem.title;
//    NSString *artist = playItem.artist;
//    NSString *album = playItem.album;
//    if (!(title && artist && album))
//        return;
//    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] initWithString:[title stringByAppendingFormat:@"\n%@\n%@", artist, album]];
//    [mas setTextColor:[UIColor colorWithRed:140.0/255.0 green:198.0/255.0 blue:63.0/255.0 alpha:1.0] range:NSMakeRange(0, title.length)];
//    [mas setFontFamily:@"Helvetica" size:20.0 bold:YES italic:NO range:NSMakeRange(0, title.length)];
//    [mas setTextColor:[UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0] range:NSMakeRange(title.length+1, artist.length)];
//    [mas setFontFamily:@"Helvetica" size:17.0 bold:YES italic:NO range:NSMakeRange(title.length+1, artist.length)];
//    [mas setTextColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0] range:NSMakeRange(title.length+2+artist.length, album.length)];
//    [mas setFontFamily:@"Helvetica" size:17.0 bold:YES italic:NO range:NSMakeRange(title.length+2+artist.length, album.length)];
//    attributedLabel.attributedText = mas;
//    songProgress.progress = playItem.progress;
//    artworkView.image = playItem.thumbnail;

    

}

- (void)viewDidUnload
{
    [(NSObject *)playItem removeObserver:self forKeyPath:@"progress"];
    [self setArtworkView:nil];
    [self setAttributedLabel:nil];
    [self setSongProgress:nil];
    [self setTopView:nil];
    [self setListeningToLabel:nil];
    [self setColorSplashView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)dealloc {
    [progressTimer invalidate];
    [progressTimer release];
    [artworkView release];
    [attributedLabel release];
    [songProgress release];
    [topView release];
    [listeningToLabel release];
    [colorSplashView release];
    [super dealloc];
}

#pragma mark -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context    
{
    if ([keyPath isEqualToString:@"progress"])
    {
        NSLog(@"progress!!");
    }
}
@end
