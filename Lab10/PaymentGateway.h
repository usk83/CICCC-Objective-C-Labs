#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaymentDelegate

@required

- (void) processPaymentAmount:(NSInteger) amount;
- (BOOL) canProcessPayment;

@end

@interface PaymentGateway : NSObject

@property (nonatomic, strong) id <PaymentDelegate> paymentDelegate;

- (void) processPaymentAmount:(NSInteger) amount;

@end

NS_ASSUME_NONNULL_END
