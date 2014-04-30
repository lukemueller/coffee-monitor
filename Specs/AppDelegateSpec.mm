#import "AppDelegate.h"
#import "BalanceViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *appDelegate;

    beforeEach(^{
        appDelegate = [[AppDelegate alloc] init];
    });
    
    describe(@"-application:didFinishLaunchingWithOptions", ^{
        beforeEach(^{
            [appDelegate application:nil didFinishLaunchingWithOptions:@{}];
        });
        
        it(@"should set the balance controller as the root view controller", ^{
            appDelegate.window.rootViewController should be_instance_of([BalanceViewController class]);
        });

        it(@"should init the BalanceViewController with a BalanceService", ^{
            BalanceViewController *controller = (BalanceViewController *)appDelegate.window.rootViewController;
            controller.balanceService should_not be_nil;
        });

        it(@"should init the balance service with a service connection", ^{
            BalanceViewController *controller = (BalanceViewController *)appDelegate.window.rootViewController;
            ServiceConnection *connection = controller.balanceService.serviceConnection;

            connection should_not be_nil;
        });
    });
    

});

SPEC_END
