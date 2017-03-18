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

@property (strong, nonatomic) NSMutableArray<NSString*>* itemsForSection1;
@property (strong, nonatomic) NSMutableArray<NSString*>* itemsForSection2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // make shoppingCartObject before use.
    NSMutableArray<Products*>* productItemArray = [[NSMutableArray alloc] init];
    self.shoppingCart = [[ShoppingCart alloc] initWithProductItemArray:productItemArray totalPricce:0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"foodViewID"]) {
        ((FoodTableViewController*)segue.destinationViewController).delegate = self;
    } else if([[segue identifier] isEqualToString:@"drinkViewID"]) {
        ((DrinkTableViewController*)segue.destinationViewController).delegate = self;
    } else if([[segue identifier] isEqualToString:@"clothViewID"]) {
        ((ClothTableViewController*)segue.destinationViewController).delegate = self;
    } else if([[segue identifier] isEqualToString:@"shoppingCartViewID"]) {
        ((ShoppingCartTableViewController*)segue.destinationViewController).delegate = self;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.priceLabel.text = [NSString stringWithFormat:@"%d",[self.shoppingCart caluculateAllItems]];
}
-(void)addProductItem:(Products*)item
{
    [self.shoppingCart addProductItem:item];
}

-(void)getItemData:(ShoppingCartTableViewController*)shoppingViewController
{
    NSMutableArray* item = [[NSMutableArray alloc] init];
    item = self.shoppingCart.productItemArray;
    [shoppingViewController updateTextView:item];
}

@end
