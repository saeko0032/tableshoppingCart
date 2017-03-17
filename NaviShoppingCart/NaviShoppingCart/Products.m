//
//  Products.m
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Products.h"

@implementation Products

- (id)initWithProductId:(int)productID
            productName:(NSString *)productName
           productPrice:(float)productPrice
   productMadeInCountry:(NSString *)productMadeInCountry {
    
    self = [super init];
    
    if(self) {
        self.productID = productID;
        self.productName = productName;
        self.productPrice = productPrice;
        self.productMadeInCountry = productMadeInCountry;
    }
    return self;
}

- (float)calculateCost
{
    return self.productPrice;
}

@end
