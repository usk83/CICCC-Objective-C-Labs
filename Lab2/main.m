#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Box *box = [[Box alloc] initWithHeight: 10.5 andWidth: 33.0 andLength: 1.1];
    NSLog(@"The volume of the box is %f", [box calculateVolume]);

    Box *another = [[Box alloc] initWithHeight: 24.5 andWidth: 1.8 andLength: 71];
    NSLog(@"The volume of another box is %f", [another calculateVolume]);

    NSLog(@"The box fits %d times inside of another box", [box calculateCountToFitInsideOf: another]);
  }
  return 0;
}
