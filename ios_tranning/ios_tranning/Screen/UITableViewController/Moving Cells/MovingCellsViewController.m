//
//  MovingCellsViewController.m
//  ios_tranning
//
//  Created by vfa on 23/08/2021.
//

#import "MovingCellsViewController.h"

@interface MovingCellsViewController ()

@end

@implementation MovingCellsViewController

- (IBAction)moveS1ToS3:(id)sender {
    [self moveSection1ToSection3];
}

- (IBAction)moveCell1InS1ToCell2InS1:(id)sender {
    [self moveCell1InSection1ToCell2InSection1];
}

- (IBAction)moveCell2InS1ToCell1InS2:(id)sender {
    [self moveCell2InSection1ToCell1InSection2];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
    
    self.tableView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSLog(@"Sent data: %i", self.value);

}

- (NSMutableArray *) newSectionWithIndex:(NSUInteger)paramIndex cellCount:(NSUInteger)paramCellCount{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSUInteger counter = 0;
    for (counter = 0;
         counter < paramCellCount;
         counter++){
        
        [result addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu",
                           (unsigned long)paramIndex,
                           (unsigned long)counter+1]];
    }
    return result;
}

- (NSMutableArray *) arrayOfSections {
    if (_arrayOfSections == nil) {
        NSMutableArray *section1 = [self newSectionWithIndex:1 cellCount:3];
        NSMutableArray *section2 = [self newSectionWithIndex:2 cellCount:3];
        NSMutableArray *section3 = [self newSectionWithIndex:3 cellCount:3];
        _arrayOfSections = [[NSMutableArray alloc] initWithArray:@[ section1, section2, section3]];
    }
    return _arrayOfSections;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrayOfSections.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *sectionArray = self.arrayOfSections[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    NSMutableArray *sectionArray = self.arrayOfSections[indexPath.section];
    cell.textLabel.text = sectionArray[indexPath.row];

    return cell;
}

- (void) moveSection1ToSection3{
    NSMutableArray *section1 = self.arrayOfSections[0];
    [self.arrayOfSections removeObject:section1];
    [self.arrayOfSections addObject:section1];
    [self.tableView moveSection:0 toSection:2];
}

- (void) moveCell1InSection1ToCell2InSection1{
    NSMutableArray *section1 = self.arrayOfSections[0];
    NSString *cell1InSection1 = section1[0];

    [section1 removeObject:cell1InSection1];
    [section1 insertObject:cell1InSection1 atIndex:1];

    NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];

    [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

- (void) moveCell2InSection1ToCell1InSection2{
    NSMutableArray *section1 = self.arrayOfSections[0];
    NSMutableArray *section2 = self.arrayOfSections[1];

    NSString *cell2InSection1 = section1[1];
    [section1 removeObject:cell2InSection1];
    [section2 insertObject:cell2InSection1 atIndex:0];

    NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

@end
