//
//  ActivityViewController.h
//  ios_tranning
//
//  Created by Vitalify on 8/16/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActivityViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldInput;

@property (weak, nonatomic) IBOutlet UIButton *buttonShare;

@property UIActivityViewController *activityViewController;
@property UIAlertController *showAlertAction;

@end

NS_ASSUME_NONNULL_END
