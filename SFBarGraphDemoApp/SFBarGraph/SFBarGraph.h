//
//  SFBarGraph.h
//  BUDGT
//
//  Created by Sebastian Flückiger on 11.10.13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define UIANIMATIONDURATION .3

@interface SFBarGraph : UIView{
   NSInteger numberOfElements;   // Number of bar elements to show
   CGFloat width;                // Width of complete bar
   CGFloat height;               // Height of complete bar
   CGFloat eqWidth;              // Widht for equalized bar
   
   NSMutableArray *elementViews; // Array holding the subviews for each element
   NSMutableArray *percentages;  // Array holding the percentages of the complete chart per element
}

/*
 Creates an SFBarChart with n elements and a corner radius of r
 */
-(id)initWithFrame:(CGRect)frame numberOfElements:(NSInteger)n andCornerRadius:(CGFloat)r;
-(void)recalibrate;


/*
 Sets the weight of all elements with NSNumber elements in CGFloat format
 Note: The values can be any CGFloat desired. The ratio between any floats will decide the size of the 
 individual bar element.
 */
-(void)setWeight:(NSMutableArray *)weights;

/*
 Returns an array with all percentages
 */
-(NSMutableArray*)getPercentages;

/*
 Returns the number of elements in the chart
 */
-(NSInteger)getNumberOfElements;

@end
