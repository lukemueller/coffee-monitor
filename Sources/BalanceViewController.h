//
//  BalanceViewController.h
//  CoffeeMonitor
//
//  Created by Luke Mueller on 4/29/14.
//

#import <UIKit/UIKit.h>
#import "BalanceService.h"


@interface BalanceViewController : UITableViewController

@property(strong, nonatomic, readwrite)BalanceService *balanceService;

- (instancetype)initWithBalanceService:(BalanceService *)balanceService;

@end
