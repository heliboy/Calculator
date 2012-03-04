//
//  CalculatorViewController.m
//  Calculator
//
//  Created by David Owens on 09/02/2012.
//  Copyright (c) 2012 Telefonica O2 Uk. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@end
@implementation CalculatorViewController
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingFormat:digit]; //[self.display setText:newDisplayText];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
    //NSLog(@"user touched %@", digit);
    
}

- (IBAction)enterPressed {

}

- (IBAction)operationPressed:(UIButton *)sender {

}


@end
