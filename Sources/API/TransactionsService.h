//
//  TransactionsService.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import "ServiceConnection.h"


@interface TransactionsService : NSObject

@property(strong, nonatomic, readwrite)ServiceConnection *serviceConnection;

- (instancetype)initWithServiceConnection:(ServiceConnection *)serviceConnection;

- (NSArray *)getTransactions;

@end
