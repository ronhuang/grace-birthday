@implementation CPControl (Tooltip)

/*!
    Sets the tooltip for the receiver.

    @param aToolTip the tooltip
*/
-(void)setToolTip:(CPString)aToolTip
{
    if (_toolTip == aToolTip)
        return;

    _toolTip = aToolTip;

    _DOMElement.title = aToolTip;
}

/*!
    Returns the receiver's tooltip
*/
-(CPString)toolTip
{
    return _toolTip;
}

@end
