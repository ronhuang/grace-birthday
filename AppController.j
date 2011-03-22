/*
 * AppController.j
 * GraceBirthday
 *
 * Created by Ron Huang on March 22, 2011.
 * Copyright 2011, Ron Huang All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "SplashView.j"
@import "MainView.j"


@implementation AppController : CPObject
{
    CPView contentView;
    SplashView splashView;
    MainView mainView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];

    if (!contentView)
        contentView = [theWindow contentView];

    /* Show splash screen. */
    if (!splashView)
    {
        splashView = [[SplashView alloc] init];
        [splashView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [splashView setCenter:[contentView center]];
    }
    [contentView addSubview:splashView];

    /* Handle splash close */
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(advance:)
               name:SplashTimeoutNotification
             object:nil];

    /*  */
    [theWindow orderFront:self];
}

- (void)advance:(CPNotification)aNotification
{
    if (!mainView)
    {
        mainView = [[MainView alloc] init];
        [mainView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [mainView setCenter:[contentView center]];
    }
    [contentView replaceSubview:splashView with:mainView];
}

@end
