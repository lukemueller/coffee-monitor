//
//  BalanceService.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import "ServiceConnection.h"

@interface BalanceService : NSObject

@property(strong, nonatomic, readwrite)ServiceConnection *serviceConnection;

- (instancetype)initWithServiceConnection:(ServiceConnection *)serviceConnection;

- (NSNumber *)getBalance;

@end
