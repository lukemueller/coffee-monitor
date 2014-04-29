//
//  BalanceService.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "ServiceConnection.h"

@interface BalanceService : NSObject

@property(strong, nonatomic, readwrite)ServiceConnection *serviceConnection;

- (instancetype)initWithServiceConnection:(ServiceConnection *)serviceConnection;

- (int)getBalance;

@end
