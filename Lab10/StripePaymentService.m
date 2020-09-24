#import <Foundation/Foundation.h>
#import "StripePaymentService.h"

@implementation StripePaymentService

- (void) processPaymentAmount:(NSInteger) amount {
  NSLog(@"Stripe processed amount $%lu", amount);
}

- (BOOL) canProcessPayment {
    return arc4random_uniform(2) == 1;
}

@end
