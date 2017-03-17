//
//  Material.m
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Material.h"

@implementation Material

- (id)initWithMaterialCode:(int)materialCode
              materialName:(NSString *)materialName
{
    self = [super init];
    if (self) {
        self.materialCode = materialCode;
        self.materialName = materialName;
    }
    return self;
}

@end
