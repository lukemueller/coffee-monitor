//
//  TestServiceConnection.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "TestServiceConnection.h"


@implementation TestServiceConnection

- (NSData *)sendRequest:(NSURLRequest *)urlRequest
      returningResponse:(NSURLResponse *)urlResponse
                  error:(NSError *)error
{
    [self setUrlRequest:urlRequest];

    return [[NSData alloc] init];
}

@end
