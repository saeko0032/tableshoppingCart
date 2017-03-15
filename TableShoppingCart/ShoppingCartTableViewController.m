//
//  ShoppingCartTableViewController.m
//  TableShoppingCart
//
//  Created by saekof on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ShoppingCartTableViewController.h"
#import "ProductImageCellTableViewCell.h"
#import "Food.h"
#import "Drink.h"
#import "Cloth.h"

@interface ShoppingCartTableViewController ()

@end

@implementation ShoppingCartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    self.productItemList = [[NSMutableArray alloc] init];
    [self.delegate getItemData:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        // close keyboard cell
        ProductImageCellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"productImageCellTableViewCellReuse"];
        if(!cell) {
            cell = [[ProductImageCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"productImageCellTableViewCellReuse"];
        }
        // step2 : data binding
        if([[self.productItemList objectAtIndex:indexPath.row] isMemberOfClass:[Food class]]) {
            cell.productImageView.image = [UIImage imageNamed:@"food_480"];
        } else if([[self.productItemList objectAtIndex:indexPath.row] isMemberOfClass:[Drink class]]){
            cell.productImageView.image = [UIImage imageNamed:@"coffee_480"];
        } else {
            cell.productImageView.image = [UIImage imageNamed:@"cloth_480"];
        }
    cell.productNameLabel.text = [self.productItemList objectAtIndex:indexPath.row].productName;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productItemList.count;
}


- (void)updateTextView:(NSMutableArray<Products*>*)items
{
    self.productItemList = items;
}
- (IBAction)closeView:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
