//
//  BalanceService.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "BalanceService.h"
#import "BalanceRequest.h"


@implementation BalanceService

- (instancetype)initWithServiceConnection:(ServiceConnection *)serviceConnection {
    self = [super init];

    if (self) {
        [self setServiceConnection:serviceConnection];
    }

    return self;
}

- (int)getBalance {
    BalanceRequest *request = [[BalanceRequest alloc] init];
    NSURLResponse *urlResponse = [[NSURLResponse alloc] init];
    NSError *error = [[NSError alloc] init];
    [self.serviceConnection sendRequest:request returningResponse:urlResponse error:error];

    return 0;
}

@end
