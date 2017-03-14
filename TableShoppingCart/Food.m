//
//  Food.m
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Food.h"

@implementation Food

- (id)initWithFoodSize:(int)productID
           productName:(NSString*)productName
          productPrice:(float)productPrice
  productMadeInCountry:(NSString *)productMadeInCountry
              foodSize:(int)foodSize
          foodCalories:(int)foodCalories
       foodIngredients:(NSArray<NSString*>*)foodIngredients
{

    self = [super initWithProductId:productID
                        productName:productName
                       productPrice:productPrice
               productMadeInCountry:productMadeInCountry];
    
    if(self) {
        self.foodSize = foodSize;
        self.foodCalories = foodCalories;
        self.foodIngredients = foodIngredients;
    }
    return self;
}

- (float)calculateCost
{
    return self.foodSize * self.productPrice;
}

@end
