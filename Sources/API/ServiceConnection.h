//
//  ServiceConnection.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//


@interface ServiceConnection : NSObject

- (NSData *)sendRequest:(NSURLRequest *)urlRequest
      returningResponse:(NSURLResponse *)urlResponse
                  error:(NSError *)error;

@end