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

    CPTextField imageNameLabel;
    CPImageView imageView;

    CPView fileList;
    CPView dirList;
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
        [self addSubview:[self buildBrowseView]];
    }

    return self;
}

/* Frame3 */
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

/* Frame2 */
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

    /* RichTextBox1 */
    imageNameLabel = [[CPTextField alloc] initWithFrame:CGRectMake(16, 24, 257, 25)];
    [imageNameLabel setStringValue:@"1234567890"];
    [imageNameLabel setToolTip:@"所看圖案的名稱"];
    [imageNameLabel setFont:[CPFont systemFontOfSize:16.0]];
    [detailView addSubview:imageNameLabel];

    /* Image1 */
    var rect = CGRectMake(16, 64, 257, 257);
    var view = [[CPBox alloc] initWithFrame:CGRectInset(rect, 1, 1)];
    imageView = [[CPImageView alloc] initWithFrame:rect];
    [imageView setToolTip:@"按一下可以看到全圖，不過會不好看"];
    [view addSubview:imageView];
    [detailView addSubview:view];

    return detailView;
}

/* Frame1 */
- (CPView)buildBrowseView
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

    /* File1 */
    fileList = [[CPBox alloc] initWithFrame:CGRectMake(176, 24, 121, 292)];
    [browseView addSubview:fileList];

    /* Dir1 */
    dirList = [[CPBox alloc] initWithFrame:CGRectMake(16, 24, 145, 201)];
    [browseView addSubview:dirList];

    /* Image6 */
    var path = [mainBundle pathForResource:@"right.bmp"];
    var image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(17, 19)];
    var view = [[CPImageView alloc] initWithFrame:CGRectMake(16, 264, 17, 19)];
    [view setImage:image];
    [browseView addSubview:view];

    /* Image5 */
    var path = [mainBundle pathForResource:@"up.bmp"];
    var image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(19, 17)];
    var view = [[CPImageView alloc] initWithFrame:CGRectMake(16, 232, 19, 17)];
    [view setImage:image];
    [browseView addSubview:view];

    /* Label2 */
    var label = [[CPTextField alloc] initWithFrame:CGRectMake(40, 264, 97, 17)];
    [label setStringValue:@"選擇要看的檔案"];
    [browseView addSubview:label];

    /* Label1 */
    var label = [[CPTextField alloc] initWithFrame:CGRectMake(40, 232, 105, 17)];
    [label setStringValue:@"選擇要看的目錄"];
    [browseView addSubview:label];

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
