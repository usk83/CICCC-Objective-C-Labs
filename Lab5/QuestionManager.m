#import "QuestionManager.h"

@implementation QuestionManager

- (instancetype) init {
  if (self = [super init]) {
    _questions = [NSMutableArray new];
  }
  return self;
}

- (NSString *) timeOutput {
  NSTimeInterval totalTime = [[self.questions valueForKeyPath: @"@sum.answerTime"] doubleValue];
  return [NSString stringWithFormat: @"total time: %.0fs, average time: %.0fs",
    roundf(totalTime),
    roundf(totalTime / [self.questions count])
  ];
}

@end
