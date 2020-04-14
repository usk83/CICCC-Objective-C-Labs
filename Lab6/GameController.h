#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic, strong, readonly) NSString *diceString;
@property (nonatomic, assign, readonly) NSInteger score;
@property (nonatomic, strong, readonly) NSArray *stats;

- (instancetype) initWithNumberOfDice: (NSInteger) numberOfDice;
- (void) rollWithError: (NSError **) error;
- (void) cheatingRollWithError: (NSError **) error;
- (void) holdDie: (NSInteger) index error: (NSError **) error;
- (void) resetDice;
- (void) doneWithError: (NSError **) error;
- (void) new;

@end

NS_ASSUME_NONNULL_END
