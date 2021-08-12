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
  _sliderItem.continuous = NO;
  _labelItemSlider.text = @(_sliderItem.value).stringValue;
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
