#import "Question.h"
#import "SubtractionQuestion.h"

@implementation SubtractionQuestion

- (void) generateQuestion {
  super.question = [NSString stringWithFormat:@"%ld - %ld ?", super.leftValue, super.rightValue];
  super.answer = super.leftValue - super.rightValue;
}

@end
