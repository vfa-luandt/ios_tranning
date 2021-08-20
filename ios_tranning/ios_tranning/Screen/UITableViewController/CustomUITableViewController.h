//
//  CustomUITableViewController.h
//  ios_tranning
//
//  Created by vfa on 20/08/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *TableViewCellIdentifier = @"MyCells";

@interface CustomUITableViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
