//
//  ServiceConnection.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import "Request.h"


@interface ServiceConnection : NSObject

- (NSData *)sendRequest:(Request *)request
      returningResponse:(NSURLResponse *__autoreleasing *)urlResponse
                  error:(NSError *__autoreleasing *)error;

@end
