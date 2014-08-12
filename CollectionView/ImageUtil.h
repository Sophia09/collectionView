//
//  ImageUtil.h
//  CollectionView
//
//  Created by thinkit  on 8/12/14.
//
//

#import <Foundation/Foundation.h>

@interface ImageUtil : NSObject

+ (UIImage *)thumbnailOfImage:(UIImage *)image withSize:(CGSize)size;

// Changes the overall hue, or tint, of the source pixels.
+ (UIImage *)hueAdjustImage:(UIImage *)image;

// Rotates the source image by the specified angle in radians.
+ (UIImage *)straightenImage:(UIImage *)image;

+ (UIImage *)findFaceInImage:(UIImage *)image;

@end
