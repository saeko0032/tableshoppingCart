//
//  Drink.m
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Drink.h"

@implementation Drink

- (id)initWithIsDrinkDiet:(int)productID
              productName:(NSString *)productName
             productPrice:(float)productPrice
     productMadeInCountry:(NSString *)productMadeInCountry
              isDrinkDiet:(bool)isDrinkDiet
                drinkSize:(int)drinkSize
{
    
    self = [super initWithProductId:productID
                        productName:productName
                       productPrice:productPrice
               productMadeInCountry:productMadeInCountry];
    
    if(self) {
        self.isDrinkDiet = isDrinkDiet;
        self.drinkSize = drinkSize;
    }
    return self;
}

- (float)calculateCost
{
    return self.productPrice;
}

@end
