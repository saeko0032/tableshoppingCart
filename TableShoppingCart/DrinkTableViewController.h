//
//  DrinkTableViewController.h
//  TableShoppingCart
//
//  Created by saekof on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drink.h"

@protocol DrinkViewControllerDelegate<NSObject>
@required
- (void)addProductItem:(Products*)item;
@end

@interface DrinkTableViewController : UITableViewController
@property (weak, nonatomic) id<DrinkViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@end
