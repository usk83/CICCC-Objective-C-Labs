#import <Foundation/Foundation.h>

@implementation NSString (PigLatin)

- (NSString *) stringByPigLatinization {
  NSCharacterSet *vowelsCaseSet = [NSCharacterSet characterSetWithCharactersInString: @"AEIOUaeiou"];

  NSMutableArray *words = [NSMutableArray arrayWithArray: [self componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]]];

  for (int i = [words count] - 1; i >= 0 ; i--) {
    NSString *word = [words objectAtIndex: i];
    if ([word length] == 0) {
      continue;
    }

    int firstVowelIndex = [word rangeOfCharacterFromSet: vowelsCaseSet].location;
    if (firstVowelIndex >= 0) {
      NSString *former = [word substringToIndex: firstVowelIndex];
      NSString *latter = [word substringFromIndex: firstVowelIndex];

      if ([former rangeOfCharacterFromSet: [NSCharacterSet uppercaseLetterCharacterSet]].location == 0) {
        latter = [latter capitalizedString];
      }
      former = [former lowercaseString];

      word = [latter stringByAppendingString: former];
    }

    word = [word stringByAppendingString: @"ay"];
    [words replaceObjectAtIndex: i withObject: word];
  }

  return [[NSArray arrayWithArray: words] componentsJoinedByString: @" "];
}

@end
