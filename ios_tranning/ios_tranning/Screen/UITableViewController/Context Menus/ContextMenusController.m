//
//  ContextMenusController.m
//  ios_tranning
//
//  Created by vfa on 23/08/2021.
//

#import "ContextMenusController.h"

@interface ContextMenusController ()

@end

@implementation ContextMenusController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifie];
    
    self.tableView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifie
                                           forIndexPath:indexPath];
    cell.textLabel.text = [[NSString alloc]
                             initWithFormat:@"Section %ld Cell %ld",
                             (long)indexPath.section,
                             (long)indexPath.row];
    return cell;
}

- (BOOL) tableView:(UITableView *)tableView
  shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
    /* Allow the context menu to be displayed on every cell */
    return YES;
}

- (BOOL) tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath
        withSender:(id)sender{
    NSLog(@"%@", NSStringFromSelector(action));
    /* Allow every action for now */
    if (action == @selector(copy:)){
        return YES;
    }
    return NO;
}

- (void) tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath
        withSender:(id)sender{
    /* Empty for now */
    if (action == @selector(copy:)){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
        [pasteBoard setString:cell.textLabel.text];
    }
}

@end
