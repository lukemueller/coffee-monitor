//
//  TestBalanceService.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import "BalanceService.h"


@interface TestBalanceService : BalanceService

@property(strong, nonatomic, readwrite)NSNumber *balance;

- (void)stubBalance:(NSNumber *)balance;

@end
