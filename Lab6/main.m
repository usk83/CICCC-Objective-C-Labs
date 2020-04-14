#import <Foundation/Foundation.h>
#import "GameController.h"

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
    GameController *cntlr = [[GameController alloc] initWithNumberOfDice: numberOfDice];
    while (YES) {
      NSLog(@"\n'roll' to roll the dice");
      NSString *input = getUserInput();
      if ([input isEqualToString: @"roll"]) {
        [cntlr roll];
      }
      NSLog(@"%@", cntlr.diceString);
    }
  }
  return 0;
}
