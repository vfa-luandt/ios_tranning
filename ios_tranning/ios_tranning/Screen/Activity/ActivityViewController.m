//
//  ActivityViewController.m
//  ios_tranning
//
//  Created by Vitalify on 8/16/21.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (IBAction)actionButtonShare:(id)sender {
    
    if ([self.textFieldInput.text length] == 0){
        [self presentViewController:showAlertAction animated:YES completion:nil];
        return;
    }
    self.activityViewController = [[UIActivityViewController alloc]
                                   initWithActivityItems:@[self.textFieldInput.text]
                                   applicationActivities:nil];
    [self presentViewController:self.activityViewController
                       animated:YES
                     completion:^{
        /* Nothing for now */
    }];
}

@synthesize showAlertAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUpView];
    [self showAlet];
}

- (void) setUpView{
    self.textFieldInput.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldInput.placeholder = @"Enter text to share...";
    self.textFieldInput.delegate = self;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void) showAlet {
    self.showAlertAction = [UIAlertController
                             alertControllerWithTitle:@"Show Alert?"
                             message:@"Please enter a text and then press Share"
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
