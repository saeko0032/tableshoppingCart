//
//  Products.h
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property (nonatomic) int productID;
@property (strong, nonatomic) NSString* productName;
@property (nonatomic) float productPrice;
@property (strong, nonatomic) NSString* productMadeInCountry;

- (id)initWithProductId:(int)productID
            productName:(NSString*)productName
           productPrice:(float)productPrice
   productMadeInCountry:(NSString*)productMadeInCountry;
- (float)calculateCost;

@end
