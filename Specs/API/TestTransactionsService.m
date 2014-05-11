//
//  TestTransactionsService.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 5/5/14.
//

#import "TestTransactionsService.h"


@implementation TestTransactionsService

- (NSArray *)getTransactions {
    return self.transactions;
}

- (void)stubTransactions:(NSArray *)transactions {
    self.transactions = transactions;
}

@end
