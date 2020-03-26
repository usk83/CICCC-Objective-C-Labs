#import <Foundation/Foundation.h>

@interface InputHandler : NSObject

- (NSString *) getUserInputWithMaxLength:(int) maxLength andPrompt:(NSString *)prompt;
+ (NSString *) getUserInputWithMaxLength:(int) maxLength andPrompt:(NSString *)prompt;

@end
