#import <Foundation/Foundation.h>
#import "AdditionQuestion.h"
#import "InputHandler.h"
#import "ScoreKeeper.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    ScoreKeeper *scoreKeeper = [ScoreKeeper new];
    while (YES) {
      AdditionQuestion *q = [AdditionQuestion new];
      NSString *answerString = [InputHandler getUserInputWithMaxLength: 255 andPrompt: q.question];
      if ([answerString isEqualToString: @"quit"]) {
        break;
      }
      NSNumber *answerNumber = [formatter numberFromString: answerString];
      if (answerNumber != nil && [answerNumber integerValue] == q.answer) {
        NSLog(@"Right!");
        scoreKeeper.right++;
      } else {
        NSLog(@"Wrong!");
        scoreKeeper.wrong++;
      }
      NSLog(@"%@", scoreKeeper);
    }
  }
  return 0;
}
