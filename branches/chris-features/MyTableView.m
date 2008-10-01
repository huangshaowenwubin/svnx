#import "MyTableView.h"
#import "MyWorkingCopy.h"
#import "MyWorkingCopyController.h"

@implementation MyTableView

// It's mandatory to subclass MyTableView to implement this method.

- (unsigned int)draggingSourceOperationMaskForLocal:(BOOL)isLocal
{
	return  NSDragOperationCopy | NSDragOperationMove ;
}

- (void)awakeFromNib
{
	[self setDoubleAction:@selector(onDoubleClick:)];	
}

- (void)onDoubleClick:(id)sender
{
	[[[[self delegate] document] controller] doubleClickInTableView:sender];

}


//----------------------------------------------------------------------------------------
// Subvert the 10.5 behaviour (which eats SOME of these events)

- (void) keyDown: (NSEvent*) theEvent
{
	[[self nextResponder] keyDown: theEvent];
}

@end
