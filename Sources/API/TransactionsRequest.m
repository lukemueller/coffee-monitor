//
//  TransactionsRequest.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import "TransactionsRequest.h"


@implementation TransactionsRequest

- (NSURLRequest *)urlRequest {
    return [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://example.com/transactions"]];
}

@end
