#import <Foundation/Foundation.h>
#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

- (void) processPaymentAmount:(NSInteger) amount {
  NSLog(@"PayPal processed amount $%lu", amount);
}

- (BOOL) canProcessPayment {
    return arc4random_uniform(2) == 1;
}

@end
