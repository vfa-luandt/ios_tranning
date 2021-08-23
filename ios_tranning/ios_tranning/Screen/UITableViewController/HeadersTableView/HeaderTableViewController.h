//
//  HeaderTableViewController.h
//  ios_tranning
//
//  Created by vfa on 23/08/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *CellIdentifier = @"CellIdentifier";

@interface HeaderTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

NS_ASSUME_NONNULL_END
