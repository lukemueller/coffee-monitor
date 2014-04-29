//
//  TestServiceConnection.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//  Copyright (c) 2014 pivotal.chicago. All rights reserved.
//

#import "ServiceConnection.h"


@interface TestServiceConnection : ServiceConnection

@property(strong, nonatomic, readwrite)NSURLRequest *urlRequest;

@end
