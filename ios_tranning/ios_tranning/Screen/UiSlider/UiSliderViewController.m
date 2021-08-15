//
//  UiSliderViewController.m
//  ios_tranning
//
//  Created by BaoNgo on 8/12/21.
//

#import "UiSliderViewController.h"

@interface UiSliderViewController ()

@end

@implementation UiSliderViewController

- (IBAction)actionSlider:(id)sender {
  int rounded = _sliderItem.value;  //Casting to an int will truncate, round down
      [sender setValue:rounded animated:NO];
  _labelItemSlider.text = @(_sliderItem.value).stringValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  _sliderItem.maximumValue = 100.0;
  _sliderItem.minimumValue = 0.0;
  _sliderItem.value = 50.0;
//  _sliderItem.continuous = NO;
  _labelItemSlider.text = @(_sliderItem.value).stringValue;
    
    
    _slider = [[UISlider alloc] initWithFrame:self.viewSlider.bounds];
    [self.viewSlider addSubview:_slider];

    // These number values represent each slider position
    _numbers = @[@(-3), @(0), @(2), @(4), @(7), @(10), @(12)];
    // slider values go from 0 to the number of values in your numbers array
    NSInteger numberOfSteps = ((float)[_numbers count] - 1);
    _slider.maximumValue = numberOfSteps;
    _slider.minimumValue = 0;

    // As the slider moves it will continously call the -valueChanged:
    _slider.continuous = YES; // NO makes it call only once you let go
    [_slider addTarget:self
            action:@selector(valueChanged:)
    forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UISlider *)sender {
  // round the slider position to the nearest index of the numbers array
  NSUInteger index = (NSUInteger)(_slider.value + 0.5);
  [_slider setValue:index animated:NO];
  NSNumber *number = _numbers[index]; // <-- This numeric value you want
  NSLog(@"sliderIndex: %i", (int)index);
  NSLog(@"number: %@", number);
  _labelItemSlider.text = number.stringValue;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
