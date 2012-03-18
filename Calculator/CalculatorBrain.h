//-------------------------------------------------------------
//  CalculatorBrain.h
//  Calculator
//
//  Created by David Owens on 10/02/2012.
//  Copyright (c) 2012 Telefonica O2 Uk. All rights reserved.
//-------------------------------------------------------------

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)pushOperand:(double)operand;
- (double)performClear;                             //Clear a single element
- (void)allClear;                                   //Clear array
- (double)performOperation:(NSString *)operations;

@end
