//
//  ShoppingCart.m
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart

- (id)initWithProductItemArray:(NSMutableArray<Products *> *)productItemArray
                   totalPricce:(int)totalPrice
{
    self = [super init];
    if (self) {
        self.productItemArray = productItemArray;
    }
    return self;
}

- (void)addProductItem:(Products *)product
{
    [self.productItemArray addObject:product];
}

- (int)caluculateAllItems
{
    int totalPrice = 0;
    for(int i = 0; i < self.productItemArray.count; i++) {
        totalPrice += [[self.productItemArray objectAtIndex:i] calculateCost];
    }
    return totalPrice;
}

@end
