//
//  Transaction.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import "Transaction.h"


@implementation Transaction

- (instancetype)initWithDate:(NSDate *)date forAmount:(NSNumber *)amount {
    self = [super init];
    if (self) {
        self.date = date;
        self.amount = amount;
    }
    return self;
}

@end
