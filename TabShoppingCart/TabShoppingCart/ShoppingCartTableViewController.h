//
//  ShoppingCartTableViewController.h
//  TableShoppingCart
//
//  Created by saekof on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCart.h"

@class ShoppingCartTableViewController;

@protocol ShoppingCartViewControllerDelegate
@required
-(void)getItemData:(ShoppingCartTableViewController*)shoppingViewController;
@end

@interface ShoppingCartTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate>
@property (weak, nonatomic) id<ShoppingCartViewControllerDelegate> delegate;
- (void)updateTextView:(NSMutableArray<Products*>*)items;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray<Products*>* productItemList;

@end
