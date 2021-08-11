//
//  AlertViewController.h
//  ios_tranning
//
//  Created by BaoNgo on 8/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@property UIAlertController *showAlertTwoAction, *showAlertAction;

@end

NS_ASSUME_NONNULL_END
