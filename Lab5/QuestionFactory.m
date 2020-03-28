#import "QuestionFactory.h"

@implementation QuestionFactory

- (instancetype) init {
  if (self = [super init]) {
    _questionSubclassNames = @[
      @"AdditionQuestion",
      @"SubtractionQuestion",
      @"MultiplicationQuestion",
      @"DivisionQuestion",
    ];
  }
  return self;
}

- (Question *) generateRandomQuestion {
  return [NSClassFromString(self.questionSubclassNames[arc4random_uniform([self.questionSubclassNames count])]) new];
}

@end
