//
//  GesturesViewController.m
//  Gestures
//
//  Created by Ariel Rodriguez
//  volonbolon@gmail.com
//

#import "GesturesViewController.h"

@interface GesturesViewController ()
- (void)pinchGestureCaptured:(UIPinchGestureRecognizer *)gesture; 
- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture; 
- (void)doubleTapGestureCaptured:(UITapGestureRecognizer *)gesture; 
- (void)twoFingersTapGestureCaptured:(UITapGestureRecognizer *)gesture; 
@end


@implementation GesturesViewController
#pragma mark -
#pragma mark Properties
@synthesize label;

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self 
                                                                               action:@selector(pinchGestureCaptured:)]; 
    [self.view addGestureRecognizer:pinch]; 
    [pinch release]; 
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                action:@selector(singleTapGestureCaptured:)];
    [self.view addGestureRecognizer:singleTap]; 
    [singleTap release]; 
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                action:@selector(doubleTapGestureCaptured:)];
    [doubleTap setNumberOfTapsRequired:2]; 
    [self.view addGestureRecognizer:doubleTap]; 
    [doubleTap release]; 
    
    UITapGestureRecognizer *twoFingers = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                 action:@selector(twoFingersTapGestureCaptured:)];
    [twoFingers setNumberOfTouchesRequired:2]; 
    [self.view addGestureRecognizer:twoFingers]; 
    [twoFingers release]; 
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	[super viewDidUnload]; 
    
    self.label = nil;
}


- (void)dealloc
{
    self.label = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Gesture Recognizer Handlers 

- (void)pinchGestureCaptured:(UIPinchGestureRecognizer *)gesture
{
    NSString *labelText = [[NSString alloc] initWithFormat:@"scale: %.2f; velocity: %.2f", 
                           gesture.scale, gesture.velocity];
    self.label.text = labelText; 
    [labelText release]; 
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    NSString *labelText = [[NSString alloc] initWithFormat:@"Single tap in %@", 
                           NSStringFromCGPoint([gesture locationInView:self.view])];
    self.label.text = labelText; 
    [labelText release]; 
}

- (void)doubleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    NSString *labelText = [[NSString alloc] initWithFormat:@"Double tap at %@", 
                           NSStringFromCGPoint([gesture locationInView:self.view])];
    self.label.text = labelText; 
    [labelText release]; 
}

- (void)twoFingersTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    NSString *labelText = [[NSString alloc] initWithFormat:@"Two fingers tap with centroid at %@",
                           NSStringFromCGPoint([gesture locationInView:self.view])];
    self.label.text = labelText; 
    [labelText release]; 
}

@end
