//
//  CalculatorViewController.m
//  Calculator
//
//  Created by David Owens on 09/02/2012.
//  Copyright (c) 2012 Telefonica O2 Uk. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h" 

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL decimalPoint;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize smalldisplay = _smalldisplay;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize decimalPoint =_decimalPoint;
@synthesize brain = _brain;

// Lazy instaniatiom of calculatorbrain

- (CalculatorBrain *)brain{
    if (!_brain) _brain =[[CalculatorBrain alloc] init];
    return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber){
        if ([digit isEqualToString:@"."]){
            NSString *dspString = self.display.text;
            NSLog(@"user touched %@", dspString);
            NSRange range = [dspString rangeOfString:@"."];
            NSLog(@"user touched %g", range);
            if (range.location == NSNotFound){
                self.display.text = [self.display.text stringByAppendingFormat:digit];
                self.smalldisplay.text = [self.smalldisplay.text stringByAppendingFormat:digit];
            }
        } else {
            self.display.text = [self.display.text stringByAppendingFormat:digit];
            self.smalldisplay.text = [self.smalldisplay.text stringByAppendingFormat:digit];  
        }
    } else {
        self.display.text = digit;
        
        if([self.smalldisplay.text isEqualToString:@"0"]) {
            self.smalldisplay.text = digit;
        } else {
            self.smalldisplay.text = [self.smalldisplay.text stringByAppendingFormat:digit]; 
        }
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    //NSLog(@"user touched %@", digit);
}

- (IBAction)enterPressed{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)clearPress {
    double result =[self.brain performClear];
    self.display.text =[NSString stringWithFormat:@"%g", result];
    
}
- (IBAction)allClear {
    double result =[self.brain performClear];
    self.display.text =[NSString stringWithFormat:@"%g", result];
    self.smalldisplay.text =[NSString stringWithFormat:@"%g", result];
    
}

- (IBAction)operationPressed:(id)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
        //self.display.text = [self.display.text stringByAppendingFormat:id];
    }
    NSString *operation =[sender currentTitle];
    self.smalldisplay.text =[self.smalldisplay.text stringByAppendingFormat:[NSString stringWithFormat:@" %@ ", operation]];
    double result = [self.brain performOperation:operation];
    self.display.text =[NSString stringWithFormat:@"%g", result];
    self.smalldisplay.text =[self.smalldisplay.text stringByAppendingFormat:[NSString stringWithFormat:@"= %g", result]];
}


@end
