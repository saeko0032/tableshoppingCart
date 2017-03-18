//
//  Food.h
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Products.h"

@interface Food : Products

@property (nonatomic) int foodSize;
@property (nonatomic) int foodCalories;
@property (strong,nonatomic) NSArray<NSString*>* foodIngredients;

- (id)initWithFoodSize:(int)productID
           productName:(NSString*)productName
          productPrice:(float)productPrice
  productMadeInCountry:(NSString*)productMadeInCountry
              foodSize:(int)foodSize
          foodCalories:(int)foodCalories
       foodIngredients:(NSArray<NSString*>*)foodIngredients;

@end
