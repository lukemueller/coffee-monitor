#import "BalanceRequest.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BalanceRequestSpec)

describe(@"BalanceRequest", ^{
    __block BalanceRequest *balanceRequest;

    beforeEach(^{
        balanceRequest = [[BalanceRequest alloc] init];
    });

    describe(@"-urlRequest", ^{
        it(@"should be a GET request", ^{
            NSURLRequest *request = [balanceRequest urlRequest];
            [request HTTPMethod] should equal(@"GET");
        });

        it(@"should have the balance URL", ^{
            NSURLRequest *request = [balanceRequest urlRequest];
            [[request URL] absoluteString] should equal(@"http://example.com/balance");
        });
    });
});

SPEC_END
