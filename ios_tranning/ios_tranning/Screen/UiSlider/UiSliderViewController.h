//
//  UiSliderViewController.h
//  ios_tranning
//
//  Created by BaoNgo on 8/12/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UiSliderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *sliderItem;

@property (weak, nonatomic) IBOutlet UILabel *labelItemSlider;

@property (weak, nonatomic) IBOutlet UIView *viewSlider;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedItem;

@property (weak, nonatomic) IBOutlet UIView *viewColor;

@property (weak, nonatomic) IBOutlet UIView *viewContainer;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong) NSTimer *progressTimer;
@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, strong) NSTimer * timer;
@property float duration;

@property UISlider *slider;
@property NSArray *numbers;

@end

NS_ASSUME_NONNULL_END
