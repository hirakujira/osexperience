

@class OSFileGridTileLabel;

@interface OSFileGridTile : UIView

@property (nonatomic, retain) UIImageView *iconView;
@property (retain) OSFileGridTileLabel *label;
@property (nonatomic, retain) NSURL *URL;
@property CGSize iconSize;
@property float gridSpacing;
@property (nonatomic) BOOL selected;

- (id)initWithIconSize:(CGSize)iconSize gridSpacing:(float)spacing;
- (void)setIcon:(UIImage*)icon;

@end