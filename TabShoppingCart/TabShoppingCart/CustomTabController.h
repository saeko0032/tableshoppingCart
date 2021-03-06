//
//  CustomTabController.h
//  TabShoppingCart
//
//  Created by saekof on 2017-03-17.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCart.h"
#import "FoodTableViewController.h"
#import "DrinkTableViewController.h"
#import "ClothTableViewController.h"
#import "ShoppingCartTableViewController.h"
#import "ViewController.h"

@interface CustomTabController : UITabBarController<UITabBarControllerDelegate, ViewControllerDelegate, FoodViewControllerDelegate, DrinkViewControllerDelegate, ClothViewControllerDelegate, ShoppingCartViewControllerDelegate>
@property (strong,nonatomic) ShoppingCart* shoppingCart;
- (void)addProductItem:(Products*)item;

@end

