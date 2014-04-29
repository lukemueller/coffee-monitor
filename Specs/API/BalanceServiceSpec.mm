#import "BalanceService.h"
#import "TestServiceConnection.h"

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

            NSURLRequest *urlRequest = testServiceConnection.urlRequest;
            [urlRequest HTTPMethod] should equal(@"GET");
            [[urlRequest URL] absoluteString] should equal(@"http://example.com/balance");
        });
    });
});

SPEC_END
