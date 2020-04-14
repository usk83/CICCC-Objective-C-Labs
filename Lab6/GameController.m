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

- (NSString *) diceString {
  return [self.dice componentsJoinedByString: @"  "];
}

@end
