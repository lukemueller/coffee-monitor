#import "BalanceService.h"
#import "TestServiceConnection.h"
#import "BalanceRequest.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BalanceServiceSpec)

describe(@"BalanceService", ^{
    __block BalanceService *balanceService;
    __block TestServiceConnection *testServiceConnection;

    beforeEach(^{
        testServiceConnection = [[TestServiceConnection alloc] init];
        balanceService = [[BalanceService alloc] initWithServiceConnection:testServiceConnection];
    });

    describe(@"-getBalance", ^{
        it(@"should make a balance request through the service connection", ^{
            [balanceService getBalance];

            Request *request = testServiceConnection.request;
            request should be_instance_of([BalanceRequest class]);
        });
    });
});

SPEC_END
