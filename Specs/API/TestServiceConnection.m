//
//  TestServiceConnection.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "TestServiceConnection.h"


@implementation TestServiceConnection

- (NSData *)sendRequest:(Request *)request
      returningResponse:(NSURLResponse *__autoreleasing *)urlResponse
                  error:(NSError *__autoreleasing *)error
{
    self.request = request;
    *urlResponse = self.urlResponse;
    *error = self.error;

    return self.data;
}

- (void)stubResponse:(NSURLResponse *)urlResponse {
    self.urlResponse = urlResponse;
}

- (void)stubData:(NSData *)data {
    self.data = data;
}

- (void)stubError:(NSError *)error {
    self.error = error;
}

@end
