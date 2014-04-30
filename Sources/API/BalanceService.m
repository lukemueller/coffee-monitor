//
//  BalanceService.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
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

- (NSNumber *)getBalance {
    BalanceRequest *request = [[BalanceRequest alloc] init];
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = nil;
    NSData *data = [self.serviceConnection sendRequest:request returningResponse:&urlResponse error:&error];

    if (error != nil || [urlResponse statusCode] != 200) {
        return nil;
    }

    id jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return jsonResponse[@"amount"];
}

@end
