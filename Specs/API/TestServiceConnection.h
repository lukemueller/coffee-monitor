//
//  TestServiceConnection.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import "ServiceConnection.h"


@interface TestServiceConnection : ServiceConnection

@property(strong, nonatomic, readwrite)Request *request;
@property(strong, nonatomic, readwrite)NSURLResponse *urlResponse;
@property(strong, nonatomic, readwrite)NSData *data;
@property(strong, nonatomic, readwrite)NSError *error;

- (void)stubResponse:(NSURLResponse *)urlResponse;

- (void)stubData:(NSData *)data;

- (void)stubError:(NSError *)error;

@end
