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
    GameController *cntlr = [[GameController alloc] initWithNumberOfDice: numberOfDice];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    while (YES) {
      NSString *input = getUserInput(@"\n'roll' to roll the dice"
                                      "\n'hold' to hold a dice"
                                      "\n'done' to end the turn"
                                      "\n'show' to see current dice"
                                      "\n'display' to show current stats"
                                      "\n'reset' to un-hold all dice"
                                      "\n'new' to start new game"
                                      "\n'quit' to quit the game");
      NSError* error = nil;
      if ([input isEqualToString: @"roll"]) {
        [cntlr rollWithError: &error];
      } else if ([input isEqualToString: @"rolll"]) {
        [cntlr cheatingRollWithError: &error];
      } else if ([input isEqualToString: @"hold"]) {
        NSString *numberString = getUserInput(@"Enter the number of the die:");
        NSNumber *number = [formatter numberFromString: numberString];
        if (number != nil) {
          [cntlr holdDie: [number integerValue] error: &error];
        }
      } else if ([input isEqualToString: @"done"]) {
        [cntlr doneWithError: &error];
      } else if ([input isEqualToString: @"show"]) {
        NSLog(@"%@", [cntlr diceString]);
        continue;
      } else if ([input isEqualToString: @"display"]) {
      } else if ([input isEqualToString: @"reset"]) {
        [cntlr resetDice];
      } else if ([input isEqualToString: @"new"]) {
        [cntlr new];
        continue;
      } else if ([input isEqualToString: @"quit"]) {
        break;
      }
      if (error) {
          NSLog(@"%@: %@", error.localizedDescription, error.localizedRecoverySuggestion);
      }
      for (NSString *stat in cntlr.stats) {
        NSLog(@"%@", stat);
      }
    }
  }
  return 0;
}
