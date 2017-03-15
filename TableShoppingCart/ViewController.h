//
//  ViewController.h
//  TableShoppingCart
//
//  Created by saekof on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageAndAddCell.h"
#import "ClothTableViewController.h"
#import "FoodTableViewController.h"
#import "DrinkTableViewController.h"
#import "ShoppingCartTableviewController.h"

@interface ViewController : UITableViewController<FoodViewControllerDelegate, DrinkViewControllerDelegate, ClothViewControllerDelegate, ShoppingCartViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong,nonatomic) ShoppingCart* shoppingCart;

- (void)addProductItem:(Products*)item;

@end

