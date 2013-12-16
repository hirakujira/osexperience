#import "OSFileGridTile.h"
#import "OSFileGridTileLabel.h"


#define labelSpace 40

@interface UIColor ()
+ (UIColor*)tableSelectionColor;
@end

@implementation OSFileGridTile

- (id)initWithIconSize:(CGSize)iconSize gridSpacing:(float)spacing{
	if(![super initWithFrame:CGRectMake(0, 0, iconSize.width + spacing, iconSize.height + labelSpace)])
		return nil;

	self.iconSize = iconSize;
	self.gridSpacing = spacing;

	/* Icon */
	CGRect iconViewFrame = CGRectMake(0, 0, self.iconSize.width, self.iconSize.height);

	self.iconView = [[UIImageView alloc] initWithFrame:iconViewFrame];
	[self addSubview:self.iconView];

	CGPoint center = self.iconView.center;
	center.x = self.bounds.size.width / 2;
	self.iconView.center = center;


	/* Label */
	self.label = [[OSFileGridTileLabel alloc] initWithFrame:CGRectMake(0, self.iconView.frame.size.height, self.bounds.size.width, labelSpace)];

	CGPoint labelCenter = self.label.center;
	labelCenter.x = self.bounds.size.width / 2;
	self.label.center = labelCenter;

	self.label.textAlignment = NSTextAlignmentCenter;

	self.label.textColor = [UIColor whiteColor];//Remember to change for windowed mode
   	self.label.font = [UIFont boldSystemFontOfSize:12];

   	self.label.backgroundColor = [UIColor clearColor];

   	self.label.lineBreakMode = NSLineBreakByTruncatingMiddle;
   	self.label.numberOfLines = 2;

   	/* For desktop only */
	self.label.shadowColor = [UIColor blackColor];
	self.label.layer.shadowColor = [[UIColor blackColor] CGColor];
	self.label.layer.shadowOffset = CGSizeMake(0.0, 0.0);
	self.label.layer.shadowRadius = 3.0;
	self.label.layer.shadowOpacity = 1;
	/* end */

	self.label.clipsToBounds = false;
	self.label.layer.shouldRasterize = true;
	[self addSubview:self.label];

	return self;
}

- (void)setSelected:(BOOL)selected{
	if(selected){
		self.label.shadowColor = [UIColor clearColor];
		self.label.layer.shadowColor = [[UIColor clearColor] CGColor];

		UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.label.bounds
                                                                   byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                                         cornerRadii:CGSizeMake(5.0, 5.0)];
		CAShapeLayer *maskLayer = [CAShapeLayer layer];
		maskLayer.frame = self.layer.bounds;
		maskLayer.path = maskPath.CGPath;
		self.label.layer.mask = maskLayer;

		self.label.backgroundColor = [UIColor tableSelectionColor];
	}else{
		self.label.shadowColor = [UIColor blackColor];
		self.label.layer.shadowColor = [[UIColor blackColor] CGColor];
	}
}

- (void)setURL:(NSURL*)url{
	_URL = url;

	NSString *text = [[url path] lastPathComponent];
	CGSize textSize = [text sizeWithFont:self.label.font];
	
	if(textSize.width < self.bounds.size.width){
		text = [NSString stringWithFormat:@"%@", text];
		//self.label.frame = CGRectMake((self.bounds.size.width / 2) - (textSize.width / 2), self.iconView.frame.size.height + (textSize.height / 2), textSize.width, textSize.height);
	}

	self.label.text = text;
}

- (void)setIcon:(UIImage*)icon{
	self.iconView.image = icon;
}

- (void)dealloc{
	[self.iconView release];
	[super dealloc];
}

@end