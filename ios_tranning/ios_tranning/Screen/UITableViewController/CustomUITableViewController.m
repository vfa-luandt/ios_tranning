//
//  CustomUITableViewController.m
//  ios_tranning
//
//  Created by vfa on 20/08/2021.
//

#import "CustomUITableViewController.h"

@interface CustomUITableViewController ()

@end

@implementation CustomUITableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpView];
}

- (void) setUpView {
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:TableViewCellIdentifier];
    
    self.tableView.dataSource = self;
    /* Make sure our table view resizes correctly */
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual:self.tableView]){
        return 3;
    }
    return 0;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.tableView]){
        switch (section){
            case 0:
                return 3;
                break;
            case 1:
                return 5;
                break;
            case 2:
                return 8;
                break;
        }
    }
    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if ([tableView isEqual:self.tableView]){
        cell = [tableView
                dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat: @"Section %ld, Cell %ld", (long)indexPath.section, (long)indexPath.row];
        
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    }
    return cell;
}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    /* Do something when the accessory button is tapped */
    NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
}

@end
