//
//  ClothTableViewController.m
//  TableShoppingCart
//
//  Created by saekof on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ClothTableViewController.h"
#import "Material.h"
#import "Cloth.h"
#import "CloseKeyboardCell.h"
#import "TextFieldCell.h"
#import "DoneAndCancelBtnCell.h"

@interface ClothTableViewController ()

@property (strong, nonatomic) NSMutableArray<NSString*>* itemsForSection1;

@end

@implementation ClothTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    self.itemsForSection1 = [@[@"clothID", @"clothName", @"clothPrice", @"clothMadeInCountry", @"materialcode, ex)code, code, ...", @"materialname, ex)name, name, ..."] mutableCopy];
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
            cell = [[DoneAndCancelBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"doneandCancelBtnReuse"];
        }
        [cell.doneButton addTarget:self action:@selector(addClothItem:) forControlEvents:UIControlEventTouchUpInside];
        [cell.cancelButton addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else {
        // do nothing
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
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

- (void)addClothItem:(UIButton*)sender {
    
    NSMutableArray<NSString*> *cellList = [[NSMutableArray alloc] init];
    for(int i = 0; i < self.itemsForSection1.count; i++) {
        TextFieldCell* tempCell = [self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
        [cellList addObject:tempCell.productTextField.text];
    }
    // To make material method
    NSString *codelist = [cellList objectAtIndex:4];
    NSArray<NSString*>* codeMaterialsList = [codelist componentsSeparatedByString:@", "];
    NSString* materialaList = [cellList objectAtIndex:5];
    NSArray<NSString*>* wholeMaterialsList = [materialaList componentsSeparatedByString:@", "];
    NSMutableArray<Material*>* materialArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<codeMaterialsList.count; i++) {
        Material* m = [[Material alloc] initWithMaterialCode:[[codeMaterialsList objectAtIndex:i] intValue]
                                                materialName:[wholeMaterialsList objectAtIndex:i]];
        [materialArray addObject:m];
    }
    // to make cloth item
    Cloth* cloth = [[Cloth alloc] initWithClothMaterials:[[cellList objectAtIndex:0] intValue]
                                             productName:[cellList objectAtIndex:1]
                                            productPrice:[[cellList objectAtIndex:2] floatValue]
                                    productMadeInCountry:[cellList objectAtIndex:3]
                                          clothMaterials:materialArray];
    
    if([self.delegate respondsToSelector:@selector(addProductItem:)]) {
        [self.delegate addProductItem:cloth];
    }
    [self closeView];
}

- (void)closeView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
