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
    UITableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld",
                           (long)indexPath.section,
                           (long)indexPath.row];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
    [button setTitle:@"Action"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(performExpand:)
     forControlEvents:UIControlEventTouchUpInside];
    
    cell.accessoryView = button;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (void)  tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        /* First remove this object from the source */
//        [self.allRows removeObjectAtIndex:indexPath.row];

        /* Then remove the associated cell from the Table View */
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }

}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    /* Do something when the accessory button is tapped */
    NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
}

- (void) performExpand:(UIButton *)paramSender{
    /* Handle the tap event of the button */
    __unused UITableViewCell *parentCell =
        (UITableViewCell *)[self superviewOfType:[UITableViewCell class]
                                         forView:paramSender];

    /* Now do something with the cell if you want to */

}

- (UIView *) superviewOfType:(Class)paramSuperviewClass
                     forView:(UIView *)paramView{
    if (paramView.superview != nil){
        if ([paramView.superview isKindOfClass:paramSuperviewClass]){
            return paramView.superview;
        } else {
            return [self superviewOfType:paramSuperviewClass
                                 forView:paramView.superview];
        }
    }

    return nil;
}

@end
