@import <AppKit/CPView.j>
@import <AppKit/CPBox.j>
@import <AppKit/CPImageView.j>
@import <AppKit/CPTextField.j>
@import <AppKit/CPButton.j>
@import "CPControl+Tooltip.j"

@implementation MainView : CPView
{
    CPBox detailView;
    CPBox browseView;

    CPButton closeButton;
    CPButton printButton;
    CPButton musicButton;
}

- (void)init
{
    self = [super init];

    if (self)
    {
        [self setFrame:CGRectMake(0, 0, 627, 455)];

        /* Frame3, Frame2, Frame1 */
        [self addSubview:[self buildControlView]];
        [self addSubview:[self buildDetailView]];
        [self addSubview:[self buildbrowseView]];
    }

    return self;
}

- (CPView)buildControlView
{
    var controlView = [[CPBox alloc] initWithFrame:CGRectMake(8, 352, 609, 89)];
    var mainBundle = [CPBundle mainBundle];

    [controlView setBorderType:CPLineBorder];
    [controlView setCornerRadius:10.0];
    //[controlView setToolTip:@"可以聽音樂，列印，和結束程式"];

    /* HACK: add caption */
    var caption = [[CPTextField alloc] initWithFrame:CGRectMake(4, 0, 0, 0)];
    [caption setStringValue:@"抉擇區"];
    [caption sizeToFit];
    [controlView addSubview:caption];

    /* Command3 */
    var path = [mainBundle pathForResource:@"close.gif"];
    var image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(124, 45)];
    closeButton = [[CPButton alloc] initWithFrame:CGRectMake(440, 24, 124, 45)];
    [closeButton setBordered:NO];
    [closeButton setImagePosition:CPImageOnly];
    [closeButton setImage:image];
    [closeButton setTarget:self];
    [closeButton setTarget:@selector(close)];
    [closeButton setToolTip:@"按一下就會結束此程式"];
    [controlView addSubview:closeButton];

    /* Command2 */
    var path = [mainBundle pathForResource:@"print.jpg"];
    var image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(124, 45)];
    printButton = [[CPButton alloc] initWithFrame:CGRectMake(248, 24, 124, 45)];
    [printButton setBordered:NO];
    [printButton setImagePosition:CPImageOnly];
    [printButton setImage:image];
    [printButton setTarget:self];
    [printButton setTarget:@selector(print)];
    [printButton setToolTip:@"按一下就可以列印欣賞區的圖案"];
    [controlView addSubview:printButton];

    /* Command1 */
    var path = [mainBundle pathForResource:@"music.bmp"];
    var image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(124, 45)];
    musicButton = [[CPButton alloc] initWithFrame:CGRectMake(56, 24, 124, 45)];
    [musicButton setBordered:NO];
    [musicButton setImagePosition:CPImageOnly];
    [musicButton setImage:image];
    [musicButton setTarget:self];
    [musicButton setTarget:@selector(music)];
    [musicButton setToolTip:@"按一下就可以聽音樂"];
    [controlView addSubview:musicButton];

    return controlView;
}

- (CPView)buildDetailView
{
    var detailView = [[CPBox alloc] initWithFrame:CGRectMake(328, 8, 289, 337)];
    var mainBundle = [CPBundle mainBundle];

    [detailView setBorderType:CPLineBorder];
    [detailView setCornerRadius:10.0];
    //[detailView setToolTip:@"顧名思義（成語）就是欣賞圖案的區域"];

    /* HACK: add caption */
    var caption = [[CPTextField alloc] initWithFrame:CGRectMake(4, 0, 0, 0)];
    [caption setStringValue:@"欣賞區"];
    [caption sizeToFit];
    [detailView addSubview:caption];

    return detailView;
}

- (CPView)buildbrowseView
{
    var browseView = [[CPBox alloc] initWithFrame:CGRectMake(8, 8, 309, 337)];
    var mainBundle = [CPBundle mainBundle];

    [browseView setBorderType:CPLineBorder];
    [browseView setCornerRadius:10.0];
    //[browseView setToolTip:@"可以選擇要看的目錄和檔案"];

    /* HACK: add caption */
    var caption = [[CPTextField alloc] initWithFrame:CGRectMake(4, 0, 0, 0)];
    [caption setStringValue:@"檔案區"];
    [caption sizeToFit];
    [browseView addSubview:caption];

    return browseView;
}

- (void)close
{
}

- (void)print
{
}

- (void)music
{
}

@end
