//
//  TestTransactionsService.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 5/5/14.
//

#import "TransactionsService.h"


@interface TestTransactionsService : TransactionsService

@property(strong, nonatomic, readwrite)NSArray *transactions;

- (void)stubTransactions:(NSArray *)transactions;

@end
