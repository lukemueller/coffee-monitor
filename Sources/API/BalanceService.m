//
//  BalanceService.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "BalanceService.h"


@implementation BalanceService

- (instancetype)initWithServiceConnection:(ServiceConnection *)serviceConnection {
    self = [super init];

    if (self) {
        [self setServiceConnection:serviceConnection];
    }

    return self;
}

- (int)getBalance {
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://example.com/balance"]];
    NSURLResponse *urlResponse = [[NSURLResponse alloc] init];
    NSError *error = [[NSError alloc] init];
    [self.serviceConnection sendRequest:urlRequest returningResponse:urlResponse error:error];

    return 0;
}

@end
