//
//  AlertViewController.h
//  ios_tranning
//
//  Created by BaoNgo on 8/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleDatePicker;

@property (weak, nonatomic) IBOutlet UILabel *titlePickerView;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@property UIAlertController *showAlertTwoAction, *showAlertAction;
@property NSArray *pickerData;

@end

NS_ASSUME_NONNULL_END
