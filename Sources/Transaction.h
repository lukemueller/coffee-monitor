//
//  Transaction.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import <Foundation/Foundation.h>


@interface Transaction : NSObject

@property(strong, nonatomic, readwrite)NSDate *date;
@property(strong, nonatomic, readwrite)NSNumber *amount;

- (instancetype)initWithDate:(NSDate *)date forAmount:(NSNumber *)amount;

@end
