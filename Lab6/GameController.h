#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic, strong, readonly) NSString *diceString;
@property (nonatomic, assign, readonly) NSInteger score;

- (instancetype) initWithNumberOfDice: (NSInteger) numberOfDice;
- (void) roll;
- (void) holdDie: (NSInteger) index;
- (void) resetDice;

@end

NS_ASSUME_NONNULL_END
