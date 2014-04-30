#import "TransactionsRequest.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(TransactionsRequestSpec)

describe(@"TransactionsRequest", ^{
    __block TransactionsRequest *transactionRequest;

    beforeEach(^{
        transactionRequest = [[TransactionsRequest alloc] init];
    });

    describe(@"-urlRequest", ^{
        it(@"should be a GET request", ^{
            NSURLRequest *request = [transactionRequest urlRequest];
            [request HTTPMethod] should equal(@"GET");
        });

        it(@"should have the transactions URL", ^{
            NSURLRequest *request = [transactionRequest urlRequest];
            [[request URL] absoluteString] should equal(@"http://example.com/transactions");
        });
    });
});

SPEC_END
