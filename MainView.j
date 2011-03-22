@import <AppKit/CPView.j>
@import <AppKit/CPBox.j>
@import <AppKit/CPImageView.j>
@import <AppKit/CPTextField.j>

@implementation MainView : CPView
{
    CPBox controlView;
    CPBox detailView;
    CPBox browseView;
}

- (void)init
{
    self = [super init];

    if (self)
    {
        [self setFrame:CGRectMake(0, 0, 627, 455)];

        /* Frame3 */
        controlView = [[CPBox alloc] initWithFrame:CGRectMake(8, 352, 609, 89)];
        [controlView setBorderType:CPLineBorder];
        [controlView setCornerRadius:10.0];
        [self addSubview:controlView];

        /* Frame2 */
        detailView = [[CPBox alloc] initWithFrame:CGRectMake(328, 8, 289, 337)];
        [detailView setBorderType:CPLineBorder];
        [detailView setCornerRadius:10.0];
        [self addSubview:detailView];

        /* Frame1 */
        browseView = [[CPBox alloc] initWithFrame:CGRectMake(8, 8, 309, 337)];
        [browseView setBorderType:CPLineBorder];
        [browseView setCornerRadius:10.0];
        [self addSubview:browseView];
    }

    return self;
}

@end
