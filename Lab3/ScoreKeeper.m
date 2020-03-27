#import "ScoreKeeper.h"

@implementation ScoreKeeper

- (NSString *) description {
  return [NSString stringWithFormat:@"score: %ld right, %ld wrong ---- %.0f%%",
    self.right,
    self.wrong,
    roundf((CGFloat)self.right * 100 / (self.right + self.wrong))
  ];
}

@end
