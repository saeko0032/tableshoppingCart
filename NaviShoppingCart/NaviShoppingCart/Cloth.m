//
//  Cloth.m
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Cloth.h"

@implementation Cloth

- (id)initWithClothMaterials:(int)productID
                 productName:(NSString *)productName
                productPrice:(float)productPrice
        productMadeInCountry:(NSString *)productMadeInCountry
              clothMaterials:(NSArray<Material*>*)clothMaterials
{
    
    self = [super initWithProductId:productID
                        productName:productName
                       productPrice:productPrice
               productMadeInCountry:productMadeInCountry];
    
    if(self) {
        self.clothMaterials = clothMaterials;
    }
    return self;
}

- (float)calculateCost
{
    return self.productPrice;
}

@end
