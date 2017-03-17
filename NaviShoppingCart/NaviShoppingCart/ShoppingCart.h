//
//  ShoppingCart.h
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Products.h"

@interface ShoppingCart : NSObject

@property (nonatomic) int totalPrice;
@property (strong, nonatomic)NSMutableArray<Products*>* productItemArray;

- (id)initWithProductItemArray:(NSMutableArray<Products*>*)productItemArray
                   totalPricce:(int)totalPrice;
- (void)addProductItem:(Products*)product;
- (int)caluculateAllItems;

@end
