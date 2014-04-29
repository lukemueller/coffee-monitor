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
        
        it(@"should set the root controller to be the navigation controller", ^{
            appDelegate.window.rootViewController should be_instance_of([UINavigationController class]);
        });
        
        it(@"should set the balance controller as the top level navigation controller", ^{
            UINavigationController *navigationController = (UINavigationController *)appDelegate.window.rootViewController;
            navigationController.topViewController should be_instance_of([BalanceViewController class]);
        });
    });
    

});

SPEC_END
