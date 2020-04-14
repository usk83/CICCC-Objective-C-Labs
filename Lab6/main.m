#import <Foundation/Foundation.h>
#import "Die.h"

static const int numberOfDice = 5;

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"=== Threelow ===");
    NSMutableArray *dice = [NSMutableArray arrayWithCapacity: numberOfDice];
    for (int i = numberOfDice; i > 0; i--) {
      [dice addObject: [Die new]];
    }
    NSLog(@"%@", [dice componentsJoinedByString: @"  "]);
  }
  return 0;
}
