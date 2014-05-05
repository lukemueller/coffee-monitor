#import "TransactionsService.h"
#import "TestServiceConnection.h"
#import "TransactionsRequest.h"
#import "Transaction.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(TransactionsServiceSpec)

describe(@"TransactionsService", ^{
    __block TestServiceConnection *testConnection;
    __block TransactionsService *transactionsService;

    beforeEach(^{
        testConnection = [[TestServiceConnection alloc] init];
        transactionsService = [[TransactionsService alloc] initWithServiceConnection:testConnection];
    });

    describe(@"-getTransactions", ^{
        it(@"should make a transactions request through the service connection", ^{
            [testConnection stubData:[@"" dataUsingEncoding:NSUTF8StringEncoding]];
            [testConnection stubResponse:[[NSHTTPURLResponse alloc] init]];

            [transactionsService getTransactions];

            testConnection.request should be_instance_of([TransactionsRequest class]);
        });

        it(@"should return an array of transactions from the API response", ^{
            NSString *responseString =
                @"{\"transactions\": \
                    [{\"date\": \"1/30/2014\", \"amount\": -12.89}, \
                     {\"date\": \"1/29/2014\", \"amount\": 100.00}, \
                     {\"date\": \"10/28/13\", \"amount\": -5.11}]}";
            [testConnection stubData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];

            NSArray *actualTransactions = [transactionsService getTransactions];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterShortStyle];

            [[(Transaction *)actualTransactions[0] amount] decimalValue] should equal([[NSNumber numberWithFloat:-12.89] decimalValue]);
            [dateFormatter stringFromDate:[(Transaction *)actualTransactions[0] date]] should equal(@"1/30/14");

            [[(Transaction *)actualTransactions[1] amount] decimalValue] should equal(@100);
            [dateFormatter stringFromDate:[(Transaction *)actualTransactions[1] date]] should equal(@"1/29/14");

            [[(Transaction *)actualTransactions[2] amount] decimalValue] should equal([[NSNumber numberWithFloat:-5.11] decimalValue]);
            [dateFormatter stringFromDate:[(Transaction *)actualTransactions[2] date]] should equal(@"10/28/13");

        });
    });
});

SPEC_END
