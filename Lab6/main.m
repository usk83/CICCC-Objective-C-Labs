#import <Foundation/Foundation.h>
#import "GameController.h"

static const int numberOfDice = 5;
static const int inputBufferSize = 255;

NSString *getUserInput(NSString *prompt) {
  NSLog(@"%@ ", prompt);
  char inputChars[inputBufferSize];
  char *result = fgets(inputChars, inputBufferSize, stdin);
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
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    while (YES) {
      NSString *input = getUserInput(@"\n'roll' to roll the dice"
                                      "\n'hold' to hold a dice"
                                      "\n'reset' to un-hold all dice");
      if ([input isEqualToString: @"roll"]) {
        [cntlr roll];
      } else if ([input isEqualToString: @"hold"]) {
        NSString *numberString = getUserInput(@"Enter the number of the die:");
        NSNumber *number = [formatter numberFromString: numberString];
        if (number != nil) {
          [cntlr holdDie: [number integerValue]];
        }
      } else if ([input isEqualToString: @"reset"]) {
        [cntlr resetDice];
      }
      NSLog(@"%@", cntlr.diceString);
    }
  }
  return 0;
}
