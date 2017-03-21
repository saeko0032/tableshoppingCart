//
//  ViewController.m
//  TableShoppingCart
//
//  Created by saekof on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self changePriceValue];
}

- (void)changePriceValue
{
    if([self.delegate respondsToSelector:@selector(changePriceValue)]) {
        ShoppingCart* tempS = [self.delegate changePriceValue];
        self.priceLabel.text = [NSString stringWithFormat:@"%d",[tempS caluculateAllItems]];
    }

}



@end
