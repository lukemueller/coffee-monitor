#import "BalanceViewController.h"
#import "TestBalanceService.h"
#import "TestTransactionsService.h"
#import "Transaction.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BalanceViewControllerSpec)

describe(@"BalanceViewController", ^{
    __block TestBalanceService *testBalanceService;
    __block TestTransactionsService *testTransactionsService;
    __block BalanceViewController *balanceController;

    beforeEach(^{
        testBalanceService = [[TestBalanceService alloc] init];
        testTransactionsService = [[TestTransactionsService alloc] init];
        balanceController = [[BalanceViewController alloc] initWithBalanceService:testBalanceService
                                                           	withTransactionService:testTransactionsService];
    });

    describe(@"-numberOfSectionsInTableView", ^{
        it(@"should return the number of sections", ^{
            [balanceController view];

            [balanceController.tableView numberOfSections] should equal(1);
        });
    });

    describe(@"-numberOfRowsInSection", ^{
        it(@"should return the number of rows for a given section", ^{
            [testTransactionsService stubTransactions:@[@1, @2, @3]];
            [balanceController view];

            [balanceController.tableView numberOfRowsInSection:0] should equal(4);
        });
    });

    describe(@"viewDidLoad", ^{
        it(@"should set balance and transactions", ^{
            [testBalanceService stubBalance:@100.00];
            Transaction *transaction = [[Transaction alloc] init];
            [testTransactionsService stubTransactions:@[transaction]];

            [balanceController view];

            balanceController.balance should equal(100);
            balanceController.transactions should equal(@[transaction]);
        });

        it(@"should display the balance in the balance button", ^{
            [testBalanceService stubBalance:@100.00];

            [balanceController view];

            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
            UITableViewCell *cell = [balanceController tableView:balanceController.tableView cellForRowAtIndexPath:indexPath];

            cell.textLabel.text should equal(@"$100.00");
        });

        it(@"should display transactions", ^{
            Transaction *firstTransaction = [[Transaction alloc] initWithDate:nil forAmount:@56.78];
            Transaction *secondTransaction = [[Transaction alloc] initWithDate:nil forAmount:@100.00];
            [testTransactionsService stubTransactions:@[firstTransaction, secondTransaction]];

            [balanceController view];

            UITableViewCell *firstTransactionCell = [balanceController tableView:balanceController.tableView
                                           cellForRowAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]];
            UITableViewCell *secondTransactionCell = [balanceController tableView:balanceController.tableView
                                                            cellForRowAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0]];

            firstTransactionCell.textLabel.text should equal(@"$56.78");
            secondTransactionCell.textLabel.text should equal(@"$100.00");
        });
    });
});

SPEC_END
