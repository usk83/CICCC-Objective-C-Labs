#import <Foundation/Foundation.h>
#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (void) processPaymentAmount:(NSInteger) amount {
  NSLog(@"Apple Pay processed amount $%lu", amount);
}

- (BOOL) canProcessPayment {
    return arc4random_uniform(2) == 1;
}

@end
