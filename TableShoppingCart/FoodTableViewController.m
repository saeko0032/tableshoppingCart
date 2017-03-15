//
//  FoodTableViewController.m
//  TableShoppingCart
//
//  Created by saekof on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "FoodTableViewController.h"
#import "CloseKeyboardCell.h"
#import "TextFieldCell.h"
#import "DoneAndCancelBtnCell.h"

@interface FoodTableViewController ()

@property (strong, nonatomic) NSMutableArray<NSString*>* itemsForSection1;

@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    self.itemsForSection1 = [@[@"FoodID", @"FoodName", @"FoodPrice", @"FoodMadeInCountry", @"FoodCalorie", @"FoodSize", @"FoodIngredients"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0) {
        // close keyboard cell
        CloseKeyboardCell* cell = [tableView dequeueReusableCellWithIdentifier:@"closeKeyboardCellReuse"];
        if(!cell) {
            cell = [[CloseKeyboardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"closeKeyboardCellReuse"];
        }
        // step2 : data binding
        [cell.closeKeyboard addTarget:self action:@selector(dismissKeyboard) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else if (indexPath.section == 1) {
        // product cell
        TextFieldCell* cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellReuse"];
        if(!cell) {
            cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textFieldCellReuse"];
        }
        cell.productTextField.tag = indexPath.row;
        cell.productTextField.placeholder =  [self.itemsForSection1 objectAtIndex:indexPath.row];
        return cell;
    } else if (indexPath.section == 2) {
        // Done and Cancel Cell
        DoneAndCancelBtnCell* cell = [tableView dequeueReusableCellWithIdentifier:@"doneAndCancelBtnCellReuse"];
        if(!cell) {
            cell = [[DoneAndCancelBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"doneAndCancelBtnReuse"];
        }
        [cell.doneButton addTarget:self action:@selector(addFoodItem:) forControlEvents:UIControlEventTouchUpInside];
        [cell.cancelButton addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else {
        // do nothing
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    } else if (section == 1) { // section = 1
        return self.itemsForSection1.count;
    } else {
        return 1;
    }
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)addFoodItem:(UIButton*)sender {
    
    NSMutableArray<NSString*> *cellList = [[NSMutableArray alloc] init];
    for(int i = 0; i < self.itemsForSection1.count; i++) {
        TextFieldCell* tempCell = [self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
        [cellList addObject:tempCell.productTextField.text];
    }
    // To make material method
    NSString *list = [cellList objectAtIndex:6];
    NSArray<NSString*>* foodIngredientsList = [list componentsSeparatedByString:@", "];
    
    Food* food = [[Food alloc] initWithFoodSize:[[cellList objectAtIndex:0] intValue]
                                    productName:[cellList objectAtIndex:1]
                                   productPrice:[[cellList objectAtIndex:2] floatValue]
                           productMadeInCountry:[cellList objectAtIndex:3]
                                       foodSize:[[cellList objectAtIndex:4] intValue]
                                   foodCalories:[[cellList objectAtIndex:5] intValue]
                                foodIngredients:foodIngredientsList];
    
    if([self.delegate respondsToSelector:@selector(addProductItem:)]) {
        [self.delegate addProductItem:food];
    }
    
    [self closeView];
}

- (void)closeView {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
