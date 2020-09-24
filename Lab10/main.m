#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

static const double RANDOM_DOLLAR_VALUE_UPPER_BOUND = 1001;
static const double RANDOM_DOLLAR_VALUE_LOWER_BOUND = 100;
static const int BUFFER_SIZE = 255;

int main(int argc, char** argv) {
  int amount = arc4random_uniform(RANDOM_DOLLAR_VALUE_UPPER_BOUND - RANDOM_DOLLAR_VALUE_LOWER_BOUND) + RANDOM_DOLLAR_VALUE_LOWER_BOUND;

  NSLog(@"Thank you for shopping at @Acme.com\n"
        "Your total today is $%d\n"
        "Please select your payment method\n"
        "1: Paypal, 2: Stripe, 3: Amazon, 4: Apple", amount);

  char inBuffer[BUFFER_SIZE];
  printf("Enter a number (1, 2, 3 or 4): ");
  fgets(inBuffer, sizeof(inBuffer), stdin);
  int selectedPaymentMethod = [[[NSString stringWithUTF8String: inBuffer] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] intValue];

  PaymentGateway *pg = [PaymentGateway new];
  switch (selectedPaymentMethod) {
  case 1:
    pg.paymentDelegate = [PaypalPaymentService new];
    break;
  case 2:
    pg.paymentDelegate = [StripePaymentService new];
    break;
  case 3:
    pg.paymentDelegate = [AmazonPaymentService new];
    break;
  case 4:
    pg.paymentDelegate = [ApplePaymentService new];
    break;
  default:
    NSLog(@"No corresponding payment method to your input. Please enter 1, 2, 3 or 4.");
    return -1;
  }

  [pg processPaymentAmount: amount];

  return 0;
}
