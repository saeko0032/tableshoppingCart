//
//  ClothViewController.h
//  ShoppingCartUIApp
//
//  Created by saekof on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cloth.h"

@protocol ClothViewControllerDelegate<NSObject>
@required
-(void)addProductItem:(Products*)item;
@end

@interface ClothViewController : UIViewController
@property (weak, nonatomic) id<ClothViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *clothIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *ClothNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *clothPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *clothWhereFromTextField;
@property (weak, nonatomic) IBOutlet UITextField *materialCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *materialTextField;

@end



