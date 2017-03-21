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

@class ViewControllerDelegate;
@protocol ViewControllerDelegate<NSObject>
@required
- (ShoppingCart*)changePriceValue;
@end

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) id<ViewControllerDelegate> delegate;
- (void)changePriceValue;
@end

