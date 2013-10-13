//
//  SFBarGraph.m
//  BUDGT
//
//  Created by Sebastian Flückiger on 11.10.13.
//
//

#import "SFBarGraph.h"

@implementation SFBarGraph

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       width = frame.size.width;
       height = frame.size.height;
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame numberOfElements:(NSInteger)n andCornerRadius:(CGFloat)r{
   self = [self initWithFrame:frame];
   if (self) {
      numberOfElements = n;
      eqWidth = (CGFloat)(width/n);
      CGFloat equiPerc = 100.0/n;
      if (!percentages) {
         percentages = [[NSMutableArray alloc]init];
      }
      if (!elementViews) {
         elementViews = [[NSMutableArray alloc]init];
      }
      for (int i = 0; i<numberOfElements; i++) {
         CGRect elFrame = CGRectMake(i*eqWidth, 0, eqWidth, height);
         UIView *newEl = [[UIView alloc]initWithFrame:elFrame];
         [newEl setBackgroundColor:[self getColorForIndex:i]];
         [elementViews addObject:newEl];
         [self addSubview:newEl];
         [self.layer setCornerRadius:r];
         self.layer.masksToBounds = YES;
         [percentages addObject:[NSNumber numberWithFloat:equiPerc]];
      }
   }
   return self;
}

-(id)initWithFrame:(CGRect)frame numberOfElements:(NSInteger)n weights:(NSMutableArray*)w andCornerRadius:(CGFloat)r{
   self = [self initWithFrame:frame numberOfElements:n andCornerRadius:r];
   if (self) {
      [self setWeight:w];
   }
   return self;
}

-(void)recalibrate{
   NSMutableArray *tmpWeights = [[NSMutableArray alloc]init];
   for (int i = 0; i<numberOfElements; i++) {
      [tmpWeights addObject:[NSNumber numberWithFloat:1]];
   }
   [self setWeight:tmpWeights];
}

-(void)setWeight:(NSMutableArray *)weights{
   CGFloat sum = 0;
   for (NSNumber* numb in weights) {
      sum += [numb floatValue];
   }
   CGFloat factor = sum/100;
   
   // Set percentages array
   NSMutableArray *pTmp = [[NSMutableArray alloc]init];
   for (int i = 0; i<numberOfElements; i++) {
      [pTmp addObject:[NSNumber numberWithFloat:[[weights objectAtIndex:i] floatValue]/factor]];
   }
   percentages = pTmp;
   
   
   // Draw results
   [UIView animateWithDuration:UIANIMATIONDURATION animations:^{
      CGFloat origin = 0;
      for (int i = 0; i<numberOfElements; i++) {
         CGFloat elWidth = [[percentages objectAtIndex:i] floatValue]*width/100;
         CGRect elFrame = CGRectMake(origin, 0, elWidth, height);
         
         [[elementViews objectAtIndex:i]setFrame:elFrame];
         origin += elWidth;
      }
   } completion:nil];

   
}
-(NSMutableArray *)getPercentages{
   return percentages;
}

/*
 Coloring
 */
-(UIColor *)getColorForIndex:(NSInteger)index{
   switch (index) {
      case 0:
         return [UIColor colorWithRed:0.243137 green:0.545098 blue:0.678431 alpha:1];
         break;
      case 1:
         return [UIColor colorWithRed:0.588235 green:0.760784 blue:0.823529 alpha:1];
         break;
      case 2:
         return [UIColor colorWithRed:0.933333 green:0.862745 blue:0.556863 alpha:1];
         break;
      case 3:
         return [UIColor colorWithRed:0.933333 green:0.749020 blue:0.380392 alpha:1];
         break;
      case 4:
         return [UIColor colorWithRed:0.913726 green:0.525490 blue:0.333333 alpha:1];
         break;
      case 5:
         return [UIColor colorWithRed:0.894118 green:0.403922 blue:0.407843 alpha:1];
         break;
      case 6:
         return [UIColor colorWithRed:0.705882 green:0.337255 blue:0.388235 alpha:1];
         break;
      case 7:
         return [UIColor colorWithRed:0.627451 green:0.466667 blue:0.635294 alpha:1];
         break;
      case 8:
         return [UIColor colorWithRed:0.541176 green:0.596078 blue:0.725490 alpha:1];
         break;
      default:
      case 9:
         return [UIColor colorWithRed:0.847059 green:0.921569 blue:0.937255 alpha:1];
         break;

      
   }
}
-(NSInteger)getNumberOfElements{
   return numberOfElements;
}

@end
