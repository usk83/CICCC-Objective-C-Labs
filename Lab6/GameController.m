#import "GameController.h"
#import "Die.h"

@interface GameController()

@property (nonatomic, assign) NSInteger remainingRolls;
@property (nonatomic, strong) NSMutableArray *dice;
@property (nonatomic, strong) NSMutableSet *heldDice;
@property (nonatomic, strong) NSSet *prevHeldDice;
@property (nonatomic, strong) NSNumber *bestScore;

@end

@implementation GameController

- (instancetype) initWithNumberOfDice: (NSInteger) numberOfDice {
  if (self = [super init]) {
    _remainingRolls = numberOfDice;
    _dice = [NSMutableArray arrayWithCapacity: numberOfDice];
    _heldDice = [NSMutableSet setWithCapacity: numberOfDice];
    _prevHeldDice = nil;
    _bestScore = nil;
    for (int i = numberOfDice; i > 0; i--) {
      [_dice addObject: [Die new]];
    }
  }
  return self;
}

- (BOOL) hasStarted {
  return self.remainingRolls != ((NSInteger)[self.dice count]);
}

- (NSError *) getNotStartedError: (NSString *) action {
  return [NSError errorWithDomain: @"" code: 0 userInfo: @{
    NSLocalizedDescriptionKey: [NSString stringWithFormat: @"Cannot %@", action],
    NSLocalizedRecoverySuggestionErrorKey: @"You have to roll dice first",
  }];
}

- (void) rollWithError: (NSError **) error {
  if (self.remainingRolls == 0) {
    *error = [NSError errorWithDomain: @"" code: 0 userInfo: @{
      NSLocalizedDescriptionKey: @"Cannot roll dice anymore",
      NSLocalizedRecoverySuggestionErrorKey: @"You can reset to restart",
    }];
    return;
  }
  if ([self.heldDice isEqualToSet: self.prevHeldDice]) {
    *error = [NSError errorWithDomain: @"" code: 0 userInfo: @{
      NSLocalizedDescriptionKey: @"Cannot roll dice",
      NSLocalizedRecoverySuggestionErrorKey: @"You have to (un)hold at least one die",
    }];
    return;
  }
  for (int i = [self.dice count] - 1; i >= 0; i--) {
    if (![self.heldDice containsObject: [NSNumber numberWithInt: i]]) {
      [(Die *)self.dice[i] roll];
    }
  }
  self.remainingRolls--;
  if (self.remainingRolls == 0) {
    [self doneWithError: error];
    return;
  }
  self.prevHeldDice = [self.heldDice copy];
}

- (void) cheatingRollWithError: (NSError **) error {
  [self rollWithError: error];
  if (*error) {
    return;
  }
  for (int i = 0; i < [self.dice count] ; i++) {
    if (![self.heldDice containsObject: [NSNumber numberWithInt: i]]) {
      ((Die *)self.dice[i]).pip = 1;
    }
  }
}

- (void) holdDie: (NSInteger) index error: (NSError **) error {
  if (!self.hasStarted) {
    *error = [self getNotStartedError: @"hold the die"];
    return;
  }
  NSNumber *indexNumber = [NSNumber numberWithInt: index];
  if ([self.heldDice containsObject: indexNumber]) {
    [self.heldDice removeObject: indexNumber];
  } else {
    [self.heldDice addObject: indexNumber];
  }
}

- (void) resetDice {
  [self.heldDice removeAllObjects];
  self.prevHeldDice = nil;
  self.remainingRolls = [self.dice count];
}

- (void) doneWithError: (NSError **) error {
  if (!self.hasStarted) {
    *error = [self getNotStartedError: @"end the turn"];
    return;
  }
  for (int i = [self.dice count] - 1; i >= 0; i--) {
    [self.heldDice addObject: [NSNumber numberWithInt: i]];
  }
  self.remainingRolls = 0;
  NSInteger s = self.score;
  if (self.bestScore == nil || s < [self.bestScore integerValue]) {
    self.bestScore = [NSNumber numberWithInt: s];
  }
}

- (void) new {
  [self resetDice];
  self.bestScore = nil;
}

- (NSString *) diceString {
  NSUInteger diceCount = [self.dice count];
  NSMutableString *str = [NSMutableString stringWithCapacity: diceCount * 3 + [self.heldDice count] * 2];
  if (![self hasStarted]) {
    for (int i = 0; i < diceCount ; i++) {
      [str appendString: @"-  "];
    }
    return [str copy];
  }
  for (int i = 0; i < diceCount ; i++) {
    if ([self.heldDice containsObject: [NSNumber numberWithInt: i]]) {
      [str appendFormat: @"[%@]  ", self.dice[i]];
    } else {
      [str appendFormat: @"%@  ", self.dice[i]];
    }
  }
  return [str copy];
}

- (NSInteger) score {
  NSInteger s = 0;
  for(NSNumber *heldDie in self.heldDice) {
    s += ((Die *)self.dice[[heldDie integerValue]]).pip;
  }
  return s;
}

- (NSArray *) stats {
  NSMutableArray *ss = [NSMutableArray arrayWithCapacity: 11];
  [ss addObject: [NSString stringWithFormat: @"Remaining Rolls: %ld", self.remainingRolls]];
  [ss addObject: @"-------------------------"];
  [ss addObject: @"--    Current Dice     --"];
  [ss addObject: [NSString stringWithFormat: @"%@", self.diceString]];
  [ss addObject: @""];
  [ss addObject: @"--    Total Score      --"];
  [ss addObject: [NSString stringWithFormat: @"Score: %ld", self.score]];
  [ss addObject: @""];
  [ss addObject: @"--    Score to beat    --"];
  if (self.bestScore) {
    [ss addObject: [NSString stringWithFormat: @"Score: %@", self.bestScore]];
  } else {
    [ss addObject: @"Score: -"];
  }
  [ss addObject: @"-------------------------"];
  return [ss copy];
}

@end
