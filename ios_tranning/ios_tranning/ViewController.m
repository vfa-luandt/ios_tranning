//
//  ViewController.m
//  ios_tranning
//
//  Created by BaoNgo on 8/11/21.
//

#import "ViewController.h"
#import "CustomUITableViewController.h"
#import "HeaderTableViewController.h"
#import "ContextMenusController.h"
#import "MovingCellsViewController.h"

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
//  self.view.backgroundColor = UIColor.brownColor;
  
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
}


@end
