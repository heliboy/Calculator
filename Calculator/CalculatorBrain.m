//
//  CalculatorBrain.m
//  Calculator
//
//  Created by David Owens on 10/02/2012.
//  Copyright (c) 2012 Telefonica O2 Uk. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

//setter defined, we don't require getter as @synthesize is enough...
- (NSMutableArray *)operandStack{
    if (!_operandStack){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}


- (double)performOperation:(NSString *)operations{
    double result = 0;
    
    // perfrom the operation here, store answer in result
    
    return result;
}

@end
