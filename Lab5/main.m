#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Question.h"
#import "QuestionFactory.h"
#import "QuestionManager.h"
#import "ScoreKeeper.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *right = @"Right!\n";
    NSString *wrong = @"Wrong!\n";
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    ScoreKeeper *scoreKeeper = [ScoreKeeper new];
    QuestionManager *questionManager = [QuestionManager new];
    QuestionFactory *questionFactory = [QuestionFactory new];

    NSLog(@"MATHS!\n\n");
    while (YES) {
      Question *q = [questionFactory generateRandomQuestion];
      [questionManager.questions addObject: q];
      NSString *answerString = [InputHandler getUserInputWithMaxLength: 255 andPrompt: q.question];
      if ([answerString isEqualToString: @"quit"]) {
        break;
      }
      NSNumber *answerNumber = [formatter numberFromString: answerString];
      NSInteger answer = q.answer;
      if (answerNumber != nil && [answerNumber integerValue] == answer) {
        NSLog(@"%@", right);
        scoreKeeper.right++;
      } else {
        NSLog(@"%@", wrong);
        scoreKeeper.wrong++;
      }
      NSLog(@"%@", scoreKeeper);
      NSLog(@"%@", [questionManager timeOutput]);
    }
  }
  return 0;
}
