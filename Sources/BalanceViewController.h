//
//  BalanceViewController.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import <UIKit/UIKit.h>
#import "BalanceService.h"
#import "TransactionsService.h"


@interface BalanceViewController : UITableViewController

@property(strong, nonatomic, readwrite)BalanceService *balanceService;
@property(strong, nonatomic, readwrite)NSNumber *balance;
@property(strong, nonatomic, readwrite)TransactionsService *transactionsService;
@property(strong, nonatomic, readwrite)NSArray *transactions;

- (instancetype)initWithBalanceService:(BalanceService *)balanceService
                withTransactionService:(TransactionsService *)transactionsService;

@end
