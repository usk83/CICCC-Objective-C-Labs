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
    QuestionFactory *questionFactory = [QuestionFactory new];
    QuestionManager *questionManager = [QuestionManager new];
    ScoreKeeper *scoreKeeper = [ScoreKeeper new];
    NSNumberFormatter *formatter = [NSNumberFormatter new];

    NSLog(@"MATHS!\n\n");
    while (YES) {
      Question *q = [questionFactory generateRandomQuestion];
      [questionManager.questions addObject: q];
      NSString *answerString = [InputHandler getUserInputWithMaxLength: 255 andPrompt: q.question];
      if ([answerString isEqualToString: @"quit"]) {
        break;
      }
      NSNumber *answerNumber = [formatter numberFromString: answerString];
      NSInteger answer = q.answer; // need to call this getter to set endTime anyway
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
