#import "Die.h"

@implementation Die

static NSArray *labels;

+ (void) initialize {
  if (self == [Die class]) {
    labels = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
  }
}

- (instancetype) init {
  if (self = [super init]) {
    [self roll];
  }
  return self;
}

- (void) roll {
  _pip = arc4random_uniform(6) + 1;
}

- (void) setPip: (NSInteger) p {
  if (1 <= p && p <= 6) {
    _pip = p;
  }
}

- (NSString *) description {
  return labels[self.pip - 1];
}

@end
