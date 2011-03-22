@import <AppKit/CPView.j>
@import <AppKit/CPBox.j>
@import <AppKit/CPImageView.j>
@import <AppKit/CPTextField.j>

SplashTimeoutNotification = @"SplashTimeoutNotification";

@implementation SplashView : CPView
{
    CPBox frameView;
    CPTimer timer;
    CPImageView logoView;
    CPTextField companyLabel;
    CPTextField versionLabel;
    CPTextField platformLabel;
    CPTextField productLabel;
    CPTextField licenseLabel;
}

- (void)init
{
    self = [super init];

    if (self)
    {
        [self setFrame:CGRectMake(0, 0, 492, 283)];

        /* Frame1 */
        frameView = [[CPBox alloc] initWithFrame:CGRectMake(10, 4, 472, 270)];
        [frameView setBorderType:CPLineBorder];
        [frameView setCornerRadius:10.0];
        [self addSubview:frameView];

        /* Timer1 */
        timer = [CPTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeout) userInfo:nil repeats:NO];

        /* imgLogo */
        var mainBundle = [CPBundle mainBundle];
        var path = [mainBundle pathForResource:@"splash.gif"];
        var image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(145, 220)];
        logoView = [[CPImageView alloc] initWithFrame:CGRectMake(24, 29, 145, 220)];
        [logoView setImage:image];
        [frameView addSubview:logoView];

        /* lblCompany */
        companyLabel = [[CPTextField alloc] initWithFrame:CGRectMake(304, 224, 161, 17)];
        [companyLabel setStringValue:@"公司：Feces'"];
        [companyLabel setAlignment:CPRightTextAlignment];
        [frameView addSubview:companyLabel];

        /* lblVersion */
        versionLabel = [[CPTextField alloc] initWithFrame:CGRectMake(400, 184, 57, 21)];
        [versionLabel setStringValue:@"版本 1.0.3"];
        [versionLabel setAlignment:CPRightTextAlignment];
        [versionLabel setFont:[CPFont systemFontOfSize:12.0]];
        [frameView addSubview:versionLabel];

        /* lblPlatform */
        platformLabel = [[CPTextField alloc] initWithFrame:CGRectMake(241, 160, 216, 21)];
        [platformLabel setStringValue:@"使用平台：Windows98"];
        [platformLabel setAlignment:CPRightTextAlignment];
        [platformLabel setFont:[CPFont systemFontOfSize:15.75]];
        [frameView addSubview:platformLabel];

        /* lblProductName */
        productLabel = [[CPTextField alloc] initWithFrame:CGRectMake(256, 88, 131, 64)];
        [productLabel setStringValue:@"Grace"];
        [productLabel setFont:[CPFont systemFontOfSize:48.0]];
        [frameView addSubview:productLabel];

        /* lblLicenseTo */
        licenseLabel = [[CPTextField alloc] initWithFrame:CGRectMake(8, 16, 457, 17)];
        [licenseLabel setStringValue:@"使用權屬於：蟲蟲"];
        [licenseLabel setAlignment:CPRightTextAlignment];
        [frameView addSubview:licenseLabel];
    }

    return self;
}

- (void)mouseUp:(CPEvent)anEvent
{
    [timer invalidate];
    [self timeout];
}

- (void)timeout
{
    [[CPNotificationCenter defaultCenter]
        postNotificationName:SplashTimeoutNotification
                      object:self];
}

@end
