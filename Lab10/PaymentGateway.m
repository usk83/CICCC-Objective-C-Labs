#import "PaymentGateway.h"

@implementation PaymentGateway

- (void) processPaymentAmount:(NSInteger) amount {
  if ([self.paymentDelegate canProcessPayment]) {
    [self.paymentDelegate processPaymentAmount: amount];
  } else {
    NSLog(@"Selected payment method could not process your payment.");
  }
}

@end
