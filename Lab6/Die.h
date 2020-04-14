#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Die : NSObject

@property (nonatomic, assign, readonly) NSInteger pip;

- (void) roll;

@end

NS_ASSUME_NONNULL_END
