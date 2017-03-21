//
//  FoodTableViewController.h
//  TableShoppingCart
//
//  Created by saekof on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"

@protocol FoodViewControllerDelegate<NSObject>
@required
- (void)addProductItem:(Products*)item;
@end

@interface FoodTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate>
@property (weak, nonatomic) id<FoodViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end
