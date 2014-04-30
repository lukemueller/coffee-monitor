#import "BalanceViewController.h"
#import "TestBalanceService.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BalanceViewControllerSpec)

describe(@"BalanceViewController", ^{
    __block TestBalanceService *testBalanceService;
    __block BalanceViewController *balanceController;

    beforeEach(^{
        testBalanceService = [[TestBalanceService alloc] init];
        balanceController = [[BalanceViewController alloc] initWithBalanceService:testBalanceService];
    });

    describe(@"-numberOfSectionsInTableView", ^{
        it(@"should return the number of sections", ^{
            [balanceController view];

            [balanceController.tableView numberOfSections] should equal(1);
        });
    });

    describe(@"-numberOfRowsInSection", ^{
        it(@"should return the number of rows for a given section", ^{
            [balanceController view];

            [balanceController.tableView numberOfRowsInSection:0] should equal(1);
        });
    });

    describe(@"viewDidLoad", ^{
        it(@"should display the balance in the balance button", ^{
            [testBalanceService stubBalance:@100.00];

            [balanceController view];

            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
            UITableViewCell *cell = [balanceController tableView:balanceController.tableView cellForRowAtIndexPath:indexPath];

            cell.textLabel.text should equal(@"$100.00");
        });
    });

});

SPEC_END
