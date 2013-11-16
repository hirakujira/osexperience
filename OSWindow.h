#import <UIKit/UIKit.h>
#import "include.h"
#import "explorer/CGPointExtension.h"

#define missionControlMinDragScale 15

@class OSWindow;


@protocol OSWindowDelegate

- (void)window:(OSWindow*)window didRecievePanGesture:(UIPanGestureRecognizer*)gesture;
- (void)window:(OSWindow*)window didRecieveResizePanGesture:(UIPanGestureRecognizer*)gesture;

@end


@interface OSWindow : UIView{
	UIToolbar *_windowBar;
	id<OSWindowDelegate> _delegate;
	CGPoint _grabPoint;
	CGPoint _grabPointInSuperview;
	CGPoint _resizeAnchor;
	CGPoint _originBeforeGesture;
	CGPoint _originInDesktop;
	CGPoint _desktopPaneOffset;
	float _scale;
	float _maxScale;
	UIBarButtonItem *_expandButton;
}

@property (nonatomic, retain) UIToolbar *windowBar;
@property (nonatomic, assign) id<OSWindowDelegate> delegate; 
@property (nonatomic, readwrite) CGPoint resizeAnchor;
@property (nonatomic, readwrite) CGPoint grabPoint;
@property (nonatomic, readwrite) CGPoint grabPointInSuperview;
@property (nonatomic, readwrite) CGPoint originBeforeGesture;
@property (nonatomic, readwrite) CGPoint originInDesktop;
@property (nonatomic, readwrite) CGPoint desktopPaneOffset;
@property (nonatomic, retain) UIBarButtonItem *expandButton;
@property (nonatomic, readwrite) float maxScale;

- (id)initWithFrame:(CGRect)arg1 title:(NSString*)title;
- (void)stopButtonPressed;
- (CGRect) CGRectFromCGPoints:(CGPoint)p1 p2:(CGPoint)p2;



float proportion(float x1, float x2, float y1, float y2);

@end


