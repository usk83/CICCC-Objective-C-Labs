#import "Question.h"
#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (void) generateQuestion {
  super.question = [NSString stringWithFormat:@"%ld + %ld ?", super.leftValue, super.rightValue];
  super.answer = super.leftValue + super.rightValue;
}

@end
