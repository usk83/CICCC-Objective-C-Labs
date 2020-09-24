#import <Foundation/Foundation.h>
#import "AmazonPaymentService.h"

@implementation AmazonPaymentService

- (void) processPaymentAmount:(NSInteger) amount {
  NSLog(@"Amazon Pay processed amount $%lu", amount);
}

- (BOOL) canProcessPayment {
    return arc4random_uniform(2) == 1;
}

@end
