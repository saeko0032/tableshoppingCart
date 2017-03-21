//
//  ClothTableViewController.h
//  TableShoppingCart
//
//  Created by saekof on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageAndAddCell.h"
#import "Cloth.h"

@protocol ClothViewControllerDelegate<NSObject>
@required
- (void)addProductItem:(Products*)item;
@end

@interface ClothTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate>
@property (weak, nonatomic) id<ClothViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end
