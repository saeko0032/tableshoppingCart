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
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.itemsForSection1 = [@[@"cloth_480", @"coffee_480", @"food_480"] mutableCopy];
    self.itemsForSection2 = [@[@"clothViewID", @"drinkViewID", @"foodViewID"] mutableCopy];
    self.priceLabel.text = @"0";
    
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

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImageAndAddCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ImageAndCellReuse"];
    if(!cell) {
        cell = [[ImageAndAddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ImageAndCellReuse"];
    }
    
    cell.myImageView.image = [UIImage imageNamed:[self.itemsForSection1 objectAtIndex:indexPath.row]];
    cell.addButton.tag = indexPath.row;
    [cell.addButton addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.priceLabel.text = [NSString stringWithFormat:@"%d",[self.shoppingCart caluculateAllItems]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 195;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsForSection1.count;
}

- (void)selectView:(UIButton*)sender {
    NSString*segueString = [self.itemsForSection2 objectAtIndex:sender.tag];
    [self performSegueWithIdentifier:segueString sender:self];
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
