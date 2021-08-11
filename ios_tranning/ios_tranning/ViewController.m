//
//  ViewController.m
//  ios_tranning
//
//  Created by BaoNgo on 8/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// action
- (IBAction)buttonAlert:(id)sender {
  printf("action Alert");
//  [self presentViewController:showOutAlert animated:YES completion:nil];
//  [self performSegueWithIdentifier:@"alertViewSegue" sender:nil];

}

- (IBAction)buttonSwitch:(id)sender {
  printf("action Switch");

}


- (void)viewDidLoad {
  [super viewDidLoad];
//  self.view.backgroundColor = UIColor.brownColor;
  
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
}


@end
