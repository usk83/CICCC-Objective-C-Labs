#import "Box.h"

@implementation Box

- (instancetype) initWithHeight:(float) height andWidth:(float) width andLength:(float) length {
  self = [super init];
  if (self) {
    _height = height;
    _width = width;
    _length = length;
  }
  return self;
}

- (float) calculateVolume {
  return self.height * self.width * self.length;
}

- (int) calculateCountToFitInsideOf:(Box *) box {
  return (int)floor([box calculateVolume] / [self calculateVolume]);
}

@end
