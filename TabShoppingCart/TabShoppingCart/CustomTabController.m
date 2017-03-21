//
//  CustomTabController.m
//  TabShoppingCart
//
//  Created by saekof on 2017-03-17.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "CustomTabController.h"

@interface CustomTabController ()

@end

@implementation CustomTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    NSMutableArray<Products*>* productItemArray = [[NSMutableArray alloc] init];
    self.shoppingCart = [[ShoppingCart alloc] initWithProductItemArray:productItemArray totalPricce:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// http://ameblo.jp/fumin65/entry-11341997812.html

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    if([viewController isMemberOfClass:[ViewController class]]) {
        ((ViewController*)viewController).delegate = self;
        [(ViewController*)viewController changePriceValue];
    } else if([viewController isMemberOfClass:[FoodTableViewController class]]) {
        ((FoodTableViewController*)viewController).delegate = self;
    } else if([viewController isMemberOfClass:[DrinkTableViewController class]]) {
        ((DrinkTableViewController*)viewController).delegate = self;
    } else if([viewController isMemberOfClass:[ClothTableViewController class]]) {
        ((ClothTableViewController*)viewController).delegate = self;
    } else {
        ((ShoppingCartTableViewController*)viewController).delegate = self;
        [self getItemData:((ShoppingCartTableViewController*)viewController)];
    }
}

-(void)addProductItem:(Products*)item
{
    [self.shoppingCart addProductItem:item];
}

-(void)getItemData:(ShoppingCartTableViewController*)shoppingViewController
{
    NSMutableArray* item = [[NSMutableArray alloc] init];
    item = self.shoppingCart.productItemArray;
    [shoppingViewController updateTextView:item];
}

- (ShoppingCart*)changePriceValue {
    return self.shoppingCart;
}

@end
