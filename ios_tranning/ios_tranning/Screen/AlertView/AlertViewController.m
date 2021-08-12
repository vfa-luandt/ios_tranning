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
  
  // Initialize Data
  _pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
  // Connect data
  self.pickerView.dataSource = self;
  self.pickerView.delegate = self;
  
  
  if (@available(iOS 13.4, *)) {
    _datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
  } else {
    // Fallback on earlier versions
  }
  
  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDate *currentDate = [NSDate date];
  NSDateComponents *comps = [[NSDateComponents alloc] init];
  [comps setYear:0];
  NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
  [comps setYear:-30];
  NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];

  _datePicker.maximumDate = maxDate;
  _datePicker.minimumDate = minDate;

  _datePicker.datePickerMode = UIDatePickerModeDate;
  [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];

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

- (void)onDatePickerValueChanged:(UIDatePicker *)datePicker {
  NSDate *currentDate = self.datePicker.date;
  NSLog(@"Date = %@", currentDate);
  NSDateFormatter * df = [[NSDateFormatter alloc] init];
  [df setDateFormat:@"yyyy-MM-dd"];
  self.titleDatePicker.text = [df stringFromDate:currentDate];
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}
// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return _pickerData.count;
}
// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  self.titlePickerView.text = _pickerData[row];
  return _pickerData[row];
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
