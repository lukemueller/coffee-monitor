//
//  ServiceConnection.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import "ServiceConnection.h"


@implementation ServiceConnection

- (NSData *)sendRequest:(Request *)request
      returningResponse:(NSURLResponse *__autoreleasing *)urlResponse
                  error:(NSError *__autoreleasing *)error
{
    return [NSURLConnection sendSynchronousRequest:request.urlRequest
                                 returningResponse:urlResponse
                                             error:error];
}

@end
