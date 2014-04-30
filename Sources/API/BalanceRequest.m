//
//  BalanceRequest.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import "BalanceRequest.h"

@implementation BalanceRequest

- (NSURLRequest *)urlRequest {
    return [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://example.com/balance"]];
}

@end
