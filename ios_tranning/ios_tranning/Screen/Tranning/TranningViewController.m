//
//  TranningViewController.m
//  ios_tranning
//
//  Created by vfa on 31/08/2021.
//

#import "TranningViewController.h"
#import "AlertViewController.h"
#import "UiSliderViewController.h"
#import "ActivityViewController.h"
#import "UIWebViewController.h"

#import "CustomUITableViewController.h"
#import "HeaderTableViewController.h"
#import "ContextMenusController.h"
#import "MovingCellsViewController.h"

@interface TranningViewController ()

@end

@implementation TranningViewController

- (IBAction)actionAlertView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AlertViewController *newView = [storyboard instantiateViewControllerWithIdentifier:@"AlertViewController"];
    [self.navigationController pushViewController:newView animated:YES];

}

- (IBAction)actionSlider:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UiSliderViewController *newView = [storyboard instantiateViewControllerWithIdentifier:@"UiSliderViewController"];
    [self.navigationController pushViewController:newView animated:YES];
}

- (IBAction)actionActivity:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ActivityViewController *newView = [storyboard instantiateViewControllerWithIdentifier:@"ActivityViewController"];
    [self.navigationController pushViewController:newView animated:YES];
}

- (IBAction)actionWebView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIWebViewController *newView = [storyboard instantiateViewControllerWithIdentifier:@"UIWebViewController"];
    [self.navigationController pushViewController:newView animated:YES];
}

- (IBAction)actionUITable:(id)sender {
    CustomUITableViewController *view = [[CustomUITableViewController alloc]initWithNibName:@"CustomUITableViewController" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
}

- (IBAction)headerTableView:(id)sender {
    HeaderTableViewController *view = [[HeaderTableViewController alloc]initWithNibName:@"HeaderTableViewController" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
}

- (IBAction)contextMenus:(id)sender {
    ContextMenusController *view = [[ContextMenusController alloc]initWithNibName:@"ContextMenusController" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
}

- (IBAction)movingCell:(id)sender {
    MovingCellsViewController *view = [[MovingCellsViewController alloc]initWithNibName:@"MovingCellsViewController" bundle:nil];
    view.value = 5;
    [self.navigationController pushViewController:view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationController.navigationBar.hidden = YES;

}

- (void) viewWillAppear:(BOOL)paramAnimated{
    [super viewWillAppear:paramAnimated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.navigationBar.hidden = YES;

}

- (void)viewDidDisappear:(BOOL)animated{
}

- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.hidden = NO;
}

@end
