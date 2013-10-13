//
//  SFViewController.h
//  SFBarGraphDemoApp
//
//  Created by Sebastian Flückiger on 13.10.13.
//  Copyright (c) 2013 Sebastian Flückiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBarGraph.h"
#import <math.h>
#import <stdlib.h>

@interface SFViewController : UIViewController

@property (nonatomic, retain) SFBarGraph *sfBarGraphRound;
@property (nonatomic, retain) SFBarGraph *sfBarGraphRect;

-(IBAction)addWeightsRoundGraph:(id)sender;
-(IBAction)addWeightsRectGraph:(id)sender;
-(IBAction)recalibrateBoth:(id)sender;

@end
