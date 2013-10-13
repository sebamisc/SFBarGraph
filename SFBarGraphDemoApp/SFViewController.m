//
//  SFViewController.m
//  SFBarGraphDemoApp
//
//  Created by Sebastian Flückiger on 13.10.13.
//  Copyright (c) 2013 Sebastian Flückiger. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()
@end

@implementation SFViewController
@synthesize sfBarGraphRound = _sfBarGraphRound;
@synthesize sfBarGraphRect = _sfBarGraphRect;
- (void)viewDidLoad
{
   [super viewDidLoad];
   [self initGraphs];
}

-(void)initGraphs{
   /*
    Initialize Rounded SFBarGraph
    Note: The standard initialization returns a bargraph with evenly distributed weights (1,...1)
    */
   if (!_sfBarGraphRound) {
      CGRect frame = CGRectMake(18, 65, 284, 20);
      _sfBarGraphRound = [[SFBarGraph alloc]initWithFrame:frame numberOfElements:5 andCornerRadius:10];
      
      [self.view addSubview:_sfBarGraphRound];
   }
   
   // Initialize Rectangular SFBarGraph
   if (!_sfBarGraphRect) {
      CGRect frame = CGRectMake(18, 200, 284, 20);
      _sfBarGraphRect = [[SFBarGraph alloc]initWithFrame:frame numberOfElements:10 andCornerRadius:0];
      [self.view addSubview:_sfBarGraphRect];
   }
}

#pragma mark - Setting weights
/*
 The following function creates an array of random numbers that will then be set as weight for the chart.
 */
-(void)addWeightsRoundGraph:(id)sender{
   NSInteger numberOfElements = [_sfBarGraphRound getNumberOfElements];
   NSMutableArray *weights = [[NSMutableArray alloc]initWithCapacity:numberOfElements];
   for (int i = 0; i<numberOfElements;i++ ) {
      float val = ((float)arc4random() / 5);
      [weights setObject:[NSNumber numberWithFloat:val] atIndexedSubscript:i];
   }
   [_sfBarGraphRound setWeight:weights];
}

/*
 The following function creates an array of random numbers that will then be set as weight for the chart.
 */
-(void)addWeightsRectGraph:(id)sender{
   NSInteger numberOfElements = [_sfBarGraphRect getNumberOfElements];
   NSMutableArray *weights = [[NSMutableArray alloc]initWithCapacity:numberOfElements];
   for (int i = 0; i<numberOfElements;i++ ) {
      float val = ((float)arc4random() / 5);
      [weights setObject:[NSNumber numberWithFloat:val] atIndexedSubscript:i];
   }
   [_sfBarGraphRect setWeight:weights];
}

#pragma mark - Recalibration
/*
 The following function reestablishes the equilibrium with a simple call to 'recalibrate' of the given chart.
 */
-(void)recalibrateBoth:(id)sender{
   [_sfBarGraphRect recalibrate];
   [_sfBarGraphRound recalibrate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
