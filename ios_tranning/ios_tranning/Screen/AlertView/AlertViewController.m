//
//  AlertViewController.m
//  ios_tranning
//
//  Created by BaoNgo on 8/11/21.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (IBAction)buttonAlertTwoAction:(id)sender {
  [self presentViewController:showAlertTwoAction animated:YES completion:nil];
}

- (IBAction)buttonAlertAction:(id)sender {
  [self presentViewController:showAlertAction animated:YES completion:nil];
}

- (IBAction)switchItem:(id)sender {
  if([sender isOn]) {
    printf("switchItem On");
  } else {
    printf("switchItem Off");
  }
}


@synthesize showAlertTwoAction, showAlertAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.view.backgroundColor = UIColor.darkGrayColor;
  
  if (@available(iOS 13.4, *)) {
    _datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
  } else {
    // Fallback on earlier versions
  }

  showAlertTwoAction = [UIAlertController
                           alertControllerWithTitle:@"Show Alert?"
                           message:@"Are you sure?"
                           preferredStyle:UIAlertControllerStyleAlert];
  
  // Do any additional setup after loading the view.
  UIAlertAction* noButton = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
    //Handle your yes please button action here
    printf("action ok");
  }];
  UIAlertAction* yesButton = [UIAlertAction
                              actionWithTitle:@"Cancel"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action) {
    //Handle your yes please button action here
    printf("action cancel");
  }];
  
  [showAlertTwoAction addAction:yesButton];
  [showAlertTwoAction addAction:noButton];
  
  
  showAlertAction = [UIAlertController
                           alertControllerWithTitle:@"Show Alert?"
                           message:@"Are you sure?"
                           preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction* okButton = [UIAlertAction
                              actionWithTitle:@"OK"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action) {
    //Handle your yes please button action here
    printf("action ok");
  }];
  
  [showAlertAction addAction:okButton];

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
