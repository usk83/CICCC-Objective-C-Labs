#import "InputHandler.h"

@implementation InputHandler

- (NSString *) getUserInputWithMaxLength:(int) maxLength andPrompt:(NSString *)prompt {
  return [InputHandler getUserInputWithMaxLength: maxLength andPrompt: prompt];
}

+ (NSString *) getUserInputWithMaxLength:(int) maxLength andPrompt:(NSString *)prompt {
  if (maxLength < 1) {
    maxLength = 255;
  }
  NSLog(@"%@ ", prompt);
  char inputChars[maxLength];
  if (fgets(inputChars, maxLength, stdin) == NULL) {
    return NULL;
  }
  return [[NSString stringWithCString: inputChars encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
