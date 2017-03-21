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
    
    self.itemsForSection1 = [@[@"FoodID", @"FoodName", @"FoodPrice", @"FoodMadeInCountry", @"FoodSize", @"FoodCalorie", @"FoodIngredients"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // product cell
    TextFieldCell* cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellReuse"];
    if(!cell) {
        cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textFieldCellReuse"];
    }
    cell.productTextField.tag = indexPath.row;
    cell.productTextField.placeholder =  [self.itemsForSection1 objectAtIndex:indexPath.row];
    return cell;
 }


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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

- (IBAction)addFoodItem:(UIButton*)sender {
    
    NSMutableArray<NSString*> *cellList = [[NSMutableArray alloc] init];
    for(int i = 0; i < self.itemsForSection1.count; i++) {
        TextFieldCell* tempCell = [self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
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
   // self.tabBarController.selectedIndex = 0;
}

@end
