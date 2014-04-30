//
//  TestBalanceService.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import "TestBalanceService.h"


@implementation TestBalanceService

- (NSNumber *)getBalance {
    return self.balance;
}

- (void)stubBalance:(NSNumber *)balance {
    self.balance = balance;
}

@end
