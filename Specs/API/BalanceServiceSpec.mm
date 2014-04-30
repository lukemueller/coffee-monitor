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
            [testServiceConnection stubData:[@"" dataUsingEncoding:NSUTF8StringEncoding]];
            [testServiceConnection stubResponse: [[NSHTTPURLResponse alloc] init]];

            [balanceService getBalance];

            Request *request = testServiceConnection.request;
            request should be_instance_of([BalanceRequest class]);
        });

        it(@"should return the balance from the API response", ^{
            NSString *responseString = @"{\"amount\": 100}";
            [testServiceConnection stubData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];

            NSURL *url = [[NSURL alloc] initWithString:@""];
            NSHTTPURLResponse *urlResponse = [[NSHTTPURLResponse alloc] initWithURL:url statusCode:200 HTTPVersion:@"1.1" headerFields:@{}];
            [testServiceConnection stubResponse:urlResponse];

            [balanceService getBalance] should equal(@100.00);
        });

        describe(@"when status code is not 200", ^{
            it(@"should return nil", ^{
                NSURL *url = [[NSURL alloc] initWithString:@""];
                NSHTTPURLResponse *urlResponse = [[NSHTTPURLResponse alloc] initWithURL:url statusCode:500 HTTPVersion:@"1.1" headerFields:@{}];
                [testServiceConnection stubResponse:urlResponse];

                [balanceService getBalance] should equal(nil);
            });
        });

        describe(@"when error is not nil", ^{
            it(@"should return nil", ^{
                NSError *error = [[NSError alloc] initWithDomain:@"error" code:1 userInfo:@{}];
                [testServiceConnection stubError:error];

                [balanceService getBalance] should equal(nil);
            });
        });
    });
});

SPEC_END
