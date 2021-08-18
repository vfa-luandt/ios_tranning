//
//  ActivityViewController.m
//  ios_tranning
//
//  Created by Vitalify on 8/16/21.
//

#import "ActivityViewController.h"
#import "UILabel+Extension.h"

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
    
    self.viewContainerTextView.layer.cornerRadius = 5;
    self.viewContainerTextView.backgroundColor = UIColor.grayColor;
    self.textViewSample.layer.cornerRadius = 5;
    self.planholderTextView.text = @"Input text here";
    self.planholderTextView.textColor = UIColor.grayColor;
    self.textViewSample.delegate = self;

    self.sampleLabel.textColor = UIColor.darkGrayColor;
    [self customLabelAttributedText];
    //    self.customLabel.showhtmlText = "";

    
    self.imageSample.image = [UIImage imageNamed: @"img_sample"];
    self.imageSample.contentMode = UIViewContentModeScaleAspectFill;
    self.imageSample.clipsToBounds = true;
    self.imageSample.layer.cornerRadius = self.imageSample.frame.size.height/2;
    
    self.imageWithUrl.contentMode = UIViewContentModeScaleAspectFill;
    self.imageWithUrl.clipsToBounds = true;
    self.imageWithUrl.layer.cornerRadius = self.imageSample.frame.size.height/2;
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://fujifilm-x.com/wp-content/uploads/2019/08/x-t30_sample-images03.jpg"]];
    self.imageWithUrl.image = [UIImage imageWithData: imageData];

//    NSURL *url = [NSURL URLWithString:@"https://fujifilm-x.com/wp-content/uploads/2019/08/x-t30_sample-images03.jpg"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:data];
//    [self.imageWithUrl setImage:image];
    
//    dispatch_async(dispatch_get_global_queue(0,0), ^{
//        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://fujifilm-x.com/wp-content/uploads/2019/08/x-t30_sample-images03.jpg"]];
//        if ( data == nil )
//            return;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // WARNING: is the cell still using the same data by this point??
//            self.imageWithUrl.image = [UIImage imageWithData: data];
//        });
//    });
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    self.sampleLabel.text = textField.text;
    return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    self.sampleLabel.text = textField.text;
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.planholderTextView.hidden = YES;
    } else {
        self.planholderTextView.hidden = NO;
    }
    NSLog(@"%@", textView.text);
}

- (void) customLabelAttributedText {
    NSString *strFirst = @"Anylengthtext";
    NSString *strSecond = @"Anylengthtext";
    NSString *strThird = @"Anylengthtext";

    NSString *strComplete = [NSString stringWithFormat:@"%@ %@ %@",strFirst,strSecond,strThird];

    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc] initWithString:strComplete];

    [attributedString addAttribute:NSForegroundColorAttributeName
                  value:[UIColor redColor]
                  range:[strComplete rangeOfString:strFirst]];

    [attributedString addAttribute:NSForegroundColorAttributeName
                  value:[UIColor blackColor]
                  range:[strComplete rangeOfString:strSecond]];

    [attributedString addAttribute:NSForegroundColorAttributeName
                  value:[UIColor blueColor]
                  range:[strComplete rangeOfString:strThird]];


    self.customLabel.attributedText = attributedString;
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
