//
//  Drink.h
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Products.h"

@interface Drink : Products

@property (nonatomic) bool isDrinkDiet;
@property (nonatomic) int drinkSize;

- (id)initWithIsDrinkDiet:(int)productID
              productName:(NSString*)productName
             productPrice:(float)productPrice
     productMadeInCountry:(NSString*)productMadeInCountry
              isDrinkDiet:(bool)isDrinkDiet
                drinkSize:(int)drinkSize;

@end
