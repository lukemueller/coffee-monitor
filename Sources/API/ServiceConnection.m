//
//  ServiceConnection.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "ServiceConnection.h"


@implementation ServiceConnection

- (NSData *)sendRequest:(Request *)request
      returningResponse:(NSURLResponse *)urlResponse
                  error:(NSError *)error
{
    return [NSURLConnection sendSynchronousRequest:request.urlRequest
                                 returningResponse:&urlResponse
                                             error:&error];
}

@end
