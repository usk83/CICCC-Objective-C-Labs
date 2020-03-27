#import "Question.h"

@implementation Question

- (instancetype) init {
  if (self = [super init]) {
    _leftValue = arc4random_uniform(91) + 10;
    _rightValue = arc4random_uniform(91) + 10;
    [self generateQuestion];
    _startTime = [NSDate date];
  }
  return self;
}

- (void) generateQuestion {}

- (NSTimeInterval) answerTime {
  return roundf([self.endTime timeIntervalSinceDate: self.startTime]);
}

// overriding getter
- (NSInteger) answer {
  _endTime = [NSDate date];
  return _answer;
}

@end
