#import <Foundation/Foundation.h>

@class Question;

NS_ASSUME_NONNULL_BEGIN

@interface QuestionFactory : NSObject

@property (nonatomic, strong) NSArray *questionSubclassNames;

- (Question *) generateRandomQuestion;

@end

NS_ASSUME_NONNULL_END
