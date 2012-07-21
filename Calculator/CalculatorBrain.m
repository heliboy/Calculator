//-------------------------------------------------------------
//  CalculatorBrain.m
//  Calculator
//
//  Created by David Owens on 10/02/2012.
//  Copyright (c) 2012 Telefonica O2 Uk. All rights reserved.
//-------------------------------------------------------------

#import "CalculatorBrain.h"
#define PI      3.14159265 /* pi */
//#define M_PI    3.14159265358979323846264338327950288   /* pi */
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

//Push Operand from the array
- (void)pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

//Pop Operand from the array
- (double)popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

//Clear the last charater
- (double)performClear{
    double result = 0;
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject]; 
    operandObject = [self.operandStack lastObject];
    if (operandObject) {
        [self.operandStack removeLastObject];
        return [operandObject doubleValue];
    } else{
        return result;
    }
}

//Empty the array
- (void)allClear{
    [self.operandStack removeAllObjects];
}

//Perform mathematical operation...
- (double)performOperation:(NSString *)operation{
    double result = 0;

    // perfrom the operation here, store answer in result
    if([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if([operation isEqualToString:@"*" ]){
        result =[self popOperand] * [self popOperand];
    } else if([operation isEqualToString:@"-"]){
        double subtrahend = [self popOperand];
        result =[self popOperand] - subtrahend;
    } else if([operation isEqualToString:@"/"]){
        double divisor = [self popOperand];
        if (divisor) result =[self popOperand] / divisor;
    } else if([operation isEqualToString:@"cos"]){
        //double divisor = [self popOperand];
        result = cos([self popOperand]);
    } else if([operation isEqualToString:@"sin"]){
        //double divisor = [self popOperand];
        result = sin([self popOperand]);
    } else if([operation isEqualToString:@"tan"]){
        //double divisor = [self popOperand];
        result = tan([self popOperand]);
    } else if([operation isEqualToString:@"sqrt"]){
        //double divisor = [self popOperand];
        result = sqrt([self popOperand]);
    } else if([operation isEqualToString:@"log"]){
        //double divisor = [self popOperand];
        result = log([self popOperand]);
    } else if([operation isEqualToString:@"PI"]){
        //double divisor = [self popOperand];
        result = PI;
    }
    
    [self pushOperand:result];
    return result;
}

@end
