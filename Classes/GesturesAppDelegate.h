//
//  GesturesAppDelegate.h
//  Gestures
//
//  Created by Ariel Rodriguez
//  volonbolon@gmail.com
//

#import <UIKit/UIKit.h>

@class GesturesViewController;

@interface GesturesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GesturesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GesturesViewController *viewController;

@end

