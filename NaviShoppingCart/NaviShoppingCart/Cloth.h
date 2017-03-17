//
//  Cloth.h
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Products.h"
#import "Material.h"

@interface Cloth : Products

@property (strong, nonatomic) NSArray<Material*>* clothMaterials;

- (id)initWithClothMaterials:(int)productID productName:(NSString*)productName productPrice:(float)productPrice productMadeInCountry:(NSString*)productMadeInCountry clothMaterials:(NSArray<Material*>*)clothMaterials;

@end
