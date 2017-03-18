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
    self.viewcontroller = self
    // Do any additional setup after loading the view.
    self.delegate = self;
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
    if([viewController isMemberOfClass:[FoodTableViewController class]]) {
        ((FoodTableViewController*)viewController).delegate = self.viewcontroller;
    } else if([viewController isMemberOfClass:[DrinkTableViewController class]]) {
        ((DrinkTableViewController*)viewController).delegate = self.viewcontroller;
    } else if([viewController isMemberOfClass:[ClothTableViewController class]]) {
        ((ClothTableViewController*)viewController).delegate = self.viewcontroller;
    } else {
        ((ShoppingCartTableViewController*)viewController).delegate = self.viewcontroller;
    }
}

@end
