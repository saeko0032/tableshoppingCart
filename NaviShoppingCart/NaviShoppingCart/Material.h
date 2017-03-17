//
//  Material.h
//  ShoppingCart
//
//  Created by saekof on 2017-03-06.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Material : NSObject

@property (nonatomic) int materialCode;
@property (strong, nonatomic) NSString* materialName;

- (id)initWithMaterialCode:(int)materialCode
              materialName:(NSString*)materialName;

@end
