#import <Foundation/Foundation.h>
#import "Die.h"

static const int numberOfDice = 5;

NSString *getUserInput() {
  char inputChars[255];
  char *result = fgets(inputChars, 255, stdin);
  if (result == NULL) {
    return NULL;
  }
  NSString *inputString = [[NSString stringWithUTF8String: inputChars] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
  return inputString;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"=== Threelow ===");
    NSMutableArray *dice = [NSMutableArray arrayWithCapacity: numberOfDice];
    for (int i = numberOfDice; i > 0; i--) {
      [dice addObject: [Die new]];
    }
    while (YES) {
      NSLog(@"\n'roll' to roll the dice");
      NSString *input = getUserInput();
      if ([input isEqualToString: @"roll"]) {
        for (Die *die in dice) {
          [die roll];
        }
      }
      NSLog(@"%@", [dice componentsJoinedByString: @"  "]);
    }
  }
  return 0;
}
