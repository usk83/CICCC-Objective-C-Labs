#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

@property (nonatomic, assign) float height;
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float length;

- (instancetype) initWithHeight:(float) height andWidth:(float) width andLength:(float) length;
- (float) calculateVolume;
- (int) calculateCountToFitInsideOf:(Box *) box;

@end

NS_ASSUME_NONNULL_END
