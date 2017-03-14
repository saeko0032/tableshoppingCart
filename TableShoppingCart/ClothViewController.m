//
//  ClothViewController.m
//  ShoppingCartUIApp
//
//  Created by saekof on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ClothViewController.h"

@interface ClothViewController ()

@end

@implementation ClothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addClothItem:(UIButton *)sender {
    // To make material method
    NSString *codelist = self.materialCodeTextField.text;
    NSArray<NSString*>* codeMaterialsList = [codelist componentsSeparatedByString:@", "];
    NSString* materialaList = self.materialTextField.text;
    NSArray<NSString*>* wholeMaterialsList = [materialaList componentsSeparatedByString:@", "];
    NSMutableArray<Material*>* materialArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<codeMaterialsList.count; i++) {
        Material* m = [[Material alloc] initWithMaterialCode:[[codeMaterialsList objectAtIndex:i] intValue]
                                                materialName:[wholeMaterialsList objectAtIndex:i]];
        [materialArray addObject:m];
    }
    // to make cloth item
    Cloth* cloth = [[Cloth alloc] initWithClothMaterials:[self.clothIDTextField.text intValue]
                                             productName:self.ClothNameTextField.text
                                            productPrice:[self.clothPriceTextField.text floatValue]
                                    productMadeInCountry:self.clothWhereFromTextField.text clothMaterials:materialArray];
    
    if([self.delegate respondsToSelector:@selector(addProductItem:)]) {
        [self.delegate addProductItem:cloth];
    }
        [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)closePage:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)closeKeyboard:(UIButton *)sender {
    [self.view endEditing:YES];
}

@end
