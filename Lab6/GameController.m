#import "GameController.h"
#import "Die.h"

@implementation GameController

- (instancetype) initWithNumberOfDice: (int) numberOfDice {
  if (self = [super init]) {
    _dice = [NSMutableArray arrayWithCapacity: numberOfDice];
    _heldDice = [NSMutableSet setWithCapacity: numberOfDice];
    for (int i = numberOfDice; i > 0; i--) {
      [_dice addObject: [Die new]];
    }
  }
  return self;
}

- (void) roll {
  for (Die *die in self.dice) {
    [die roll];
  }
}

- (void) holdDie: (NSInteger) index {
  NSNumber *indexNumber = [NSNumber numberWithInt: index];
  if ([self.heldDice containsObject: indexNumber]) {
    [self.heldDice removeObject: indexNumber];
  } else {
    [self.heldDice addObject: indexNumber];
  }
}

- (void) resetDice {
  [self.heldDice removeAllObjects];
}

- (NSString *) diceString {
  NSUInteger diceCount = [self.dice count];
  NSMutableString *str = [NSMutableString stringWithCapacity: diceCount * 3 + [self.heldDice count] * 2];
  for (int i = 0; i < diceCount ; i++) {
    if ([self.heldDice containsObject: [NSNumber numberWithInt: i]]) {
      [str appendFormat: @"[%@]  ", self.dice[i]];
    } else {
      [str appendFormat: @"%@  ", self.dice[i]];
    }
  }
  return [str copy];
}

@end
