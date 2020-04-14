#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic, strong) NSMutableArray *dice;
@property (nonatomic, strong) NSMutableSet *heldDice;
@property (nonatomic, strong, readonly) NSString *diceString;

- (instancetype) initWithNumberOfDice: (int) numberOfDice;
- (void) roll;
- (void) holdDie: (NSInteger) index;
- (void) resetDice;

@end

NS_ASSUME_NONNULL_END
