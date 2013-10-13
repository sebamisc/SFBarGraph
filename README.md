SFBarGraph
==========

A fully animated bar graph for iOS that allows for simple creation &amp; manipulation.

## How it works

### Initialization 
Set up a CGRect where you want to display the chart, and a respective corner radius

```
CGRect frame = CGRectMake(18, 65, 284, 20);
_sfBarGraph = [[SFBarGraph alloc]initWithFrame:frame numberOfElements:5 andCornerRadius:frame.size.height/2];
```

### Adding weights
Create a NSMutableArray with NSNumbers. The bar's brain will automatically compute the right percentages and display them fully animated.

```
NSInteger numberOfElements = [_sfBarGraph getNumberOfElements];
NSMutableArray *weights = [[NSMutableArray alloc]initWithCapacity:numberOfElements];
for (int i = 0; i<numberOfElements;i++ ) {
    float someWeight = 1;
    [weights setObject:[NSNumber numberWithFloat:someWeight] atIndexedSubscript:i];
}
[_sfBarGraphRound setWeight:weights];
```

### Recalibration

To save you the hassle of setting the weights to 1 yourself, SFBarGraph contains the method ```-(void)recalibrate;```. Calling it will set all weights to 1 and display an animated transition.

### Animations

Animations are done fully automated. The standard animation duration is .3 seconds. You can reset it in the SFBarGraph.h file. To disable animations set the makro to 0.

```
#define UIANIMATIONDURATION .3
```

### Coloring

The colors can be set in the ```SFBarGraph.m``` file by changing the return values of  ```-(UIColor *)getColorForIndex:(NSInteger)index;```. The standard version contains 10 matching colors and is fully extendable with more and different colors.


## Sample Project

The ***SFBarGraphDemoApp*** contains an iPhone .xcodeproj to demonstrate the capabilities.

### Screenshots
![Screen1](/path/to/img.jpg) ![Screen2](/path/to/img.jpg)
