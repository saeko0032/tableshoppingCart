//
//  CloseKeyboardCell.m
//  TableShoppingCart
//
//  Created by saekof on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "CloseKeyboardCell.h"

@implementation CloseKeyboardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.closeKeyboard.titleLabel.text = @"Close Keyboard";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)closeView:(UIButton *)sender {
    [self.inputViewController.view endEditing:YES];
}

@end
