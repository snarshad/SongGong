//
//  SGRdioSourceViewController.m
//  SongGong
//
//  Created by Daniel DeCovnick on 7/17/11.
//  Copyright 2011 doubleTwist Corporation. All rights reserved.
//

#import "SGRdioSourceViewController.h"
#import "SGRdioSource.h"

@implementation SGRdioSourceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        source = [[SGRdioSource alloc] init];
        source.delegate = self;
        // Custom initialization
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)carouselDidSendViewToBack
{
    artworkOrIcon.image = [UIImage imageNamed:@"mainicons_r_1"];
    topView.hidden = YES;
    colorSplash.hidden = YES;
    titleLabel.hidden = YES;
    artistLabel.hidden = YES;
    bottomView.hidden = YES;
    [self.view setNeedsDisplay];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(pushGenericPlayer) object:nil];
}


@end
