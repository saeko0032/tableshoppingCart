//
//  DrinkTableViewController.m
//  TableShoppingCart
//
//  Created by saekof on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "DrinkTableViewController.h"
#import "CloseKeyboardCell.h"
#import "TextFieldCell.h"
#import "DoneAndCancelBtnCell.h"

@interface DrinkTableViewController ()

@property (strong, nonatomic) NSMutableArray<NSString*>* itemsForSection1;

@end

@implementation DrinkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    self.itemsForSection1 = [@[@"DrinkID", @"DrinkName", @"DrinkPrice", @"DrinkMadeInCountry", @"isDrinkDiet", @"DrinkSize"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        TextFieldCell* cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellReuse"];
        if(!cell) {
            cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textFieldCellReuse"];
        }
        cell.productTextField.tag = indexPath.row;
        cell.productTextField.placeholder =  [self.itemsForSection1 objectAtIndex:indexPath.row];
    if(![cell.productTextField.text isEqualToString:@""]) {
        cell.productTextField.text = @"";
    }
        return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.itemsForSection1.count;
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)addDrinkItem:(UIButton*)sender {
    
    NSMutableArray<NSString*> *cellList = [[NSMutableArray alloc] init];
    for(int i = 0; i < self.itemsForSection1.count; i++) {
        TextFieldCell* tempCell = [self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [cellList addObject:tempCell.productTextField.text];
    }
    
    Drink* drink = [[Drink alloc] initWithIsDrinkDiet:[[cellList objectAtIndex:0] intValue]
                                          productName:[cellList objectAtIndex:1]
                                         productPrice:[[cellList objectAtIndex:2] floatValue]
                                 productMadeInCountry:[cellList objectAtIndex:3]
                                          isDrinkDiet:[cellList objectAtIndex:4]
                                            drinkSize:[[cellList objectAtIndex:5] intValue]];
    
    if([self.delegate respondsToSelector:@selector(addProductItem:)]) {
        [self.delegate addProductItem:drink];
    }
    
    [self closeView];
}

- (IBAction)closeKeyboard:(UIButton *)sender {
    [self.view endEditing:YES];
}

- (void)closeView {
    // update Tableview
    [self.myTableView reloadData];
}

@end
