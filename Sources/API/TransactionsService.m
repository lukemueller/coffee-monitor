//
//  TransactionsService.m
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/30/14.
//

#import "TransactionsService.h"
#import "TransactionsRequest.h"
#import "Transaction.h"


@implementation TransactionsService

- (instancetype)initWithServiceConnection:(ServiceConnection *)serviceConnection {
    self = [super init];
    if (self) {
        self.serviceConnection = serviceConnection;
    }
    return self;
}

- (NSArray *)getTransactions {
    TransactionsRequest *request = [[TransactionsRequest alloc] init];
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = nil;
    NSData *data = [self.serviceConnection sendRequest:request returningResponse:&urlResponse error:&error];

    id jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSMutableArray *transactions = [[NSMutableArray alloc] init];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];

    for (id object in jsonResponse[@"transactions"]) {
        NSNumber *amount = (NSNumber *)object[@"amount"];
        NSDate *date = [dateFormatter dateFromString:object[@"date"]];

        Transaction *transaction = [[Transaction alloc] initWithDate:date forAmount:amount];
        [transactions addObject:transaction];
    }

    return transactions;
}

@end
