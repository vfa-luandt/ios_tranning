//
//  HeaderTableViewController.m
//  ios_tranning
//
//  Created by vfa on 23/08/2021.
//

#import "HeaderTableViewController.h"

@interface HeaderTableViewController ()

@end

@implementation HeaderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                           forIndexPath:indexPath];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %ld",
                             (long)indexPath.row];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UILabel *) newLabelWithTitle:(NSString *)paramTitle {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = paramTitle;
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    return label;
}

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
////    if (section == 0){
////        return [self newLabelWithTitle:@"Section 1 Header"];
////    }
////    return nil;
//    
//    UIView *header = nil;
//    if (section == 0){
//        UILabel *label = [self newLabelWithTitle:@"Section 1 Header"];
//        /* Move the label 10 points to the right */
//        label.frame = CGRectMake(label.frame.origin.x + 10.0f, 5.0f, /* Go 5 points down in y axis */
//                                 label.frame.size.width, label.frame.size.height);
//        
//        /* Give the container view 10 points more in width than our label
//         because the label needs a 10 extra points left-margin */
//        CGRect resultFrame = CGRectMake(0.0f, 0.0f, label.frame.size.width + 10.0f, label.frame.size.height);
//        header = [[UIView alloc] initWithFrame:resultFrame];
//        [header addSubview:label];
//    }
//    return header;
//}

//- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return [self newLabelWithTitle:@"Section 1 Footer"];
//    }
//    return nil;
//
////    UIView *footer = nil;
////    if (section == 0){
////        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
////        /* Move the label 10 points to the right */
////        label.frame = CGRectMake(label.frame.origin.x + 10.0f,
////                                 5.0f, /* Go 5 points down in y axis */
////                                 label.frame.size.width,
////                                 label.frame.size.height);
////
////        /* Give the container view 10 points more in width than our label
////         because the label needs a 10 extra points left-margin */
////        CGRect resultFrame = CGRectMake(0.0f,
////                                        0.0f,
////                                        label.frame.size.width + 10.0f,
////                                        label.frame.size.height);
////        footer = [[UIView alloc] initWithFrame:resultFrame];
////        [footer addSubview:label];
////
////    }
////    return footer;
//}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"Section 1 Header";
    }
    return nil;

}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0){
        return @"Section 1 Footer";
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 30.0f;
    }
    return 0.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 30.0f;
    }
    return 0.0f;
}


@end
