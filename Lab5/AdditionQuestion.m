#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype) init{
  if (self = [super init]) {
    NSInteger left = arc4random_uniform(91) + 10;
    NSInteger right = arc4random_uniform(91) + 10;
    _question = [NSString stringWithFormat:@"%ld + %ld ?", left, right];
    _answer = left + right;
  }
  return self;
}

@end
