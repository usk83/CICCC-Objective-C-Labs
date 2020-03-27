#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputHandler : NSObject

- (NSString *) getUserInputWithMaxLength:(int) maxLength andPrompt:(NSString *)prompt;
+ (NSString *) getUserInputWithMaxLength:(int) maxLength andPrompt:(NSString *)prompt;

@end

NS_ASSUME_NONNULL_END
