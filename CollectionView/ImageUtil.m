//
//  ImageUtil.m
//  CollectionView
//
//  Created by thinkit  on 8/12/14.
//
//

#import "ImageUtil.h"

@implementation ImageUtil

+ (UIImage *)thumbnailOfImage:(UIImage *)image withSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    if (size.height <   image.size.height)
    {
        float ration = size.height / image.size.height;
        [image drawInRect:CGRectMake(0, 0, image.size.width * ration, size.height)];
    }
    else
    {
        float ration = size.width / image.size.width;
        [image drawInRect:CGRectMake(0, 0, size.width, image.size.height * ration)];
    }
    UIImage *aspectFillImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aspectFillImage;
}

// Changes the overall hue, or tint, of the source pixels.
+ (UIImage *)hueAdjustImage:(UIImage *)image
{
    CIImage *main = [[CIImage alloc] initWithImage:image];
    
    CIFilter *hueAdjust = [CIFilter filterWithName:@"CIHueAdjust"];
    [hueAdjust setDefaults];
    [hueAdjust setValue:main forKey:@"inputImage"];
    [hueAdjust setValue:[NSNumber numberWithFloat:3.14 / 2.0f] forKey:@"inputAngle"];
    
    CIImage *outputHueAdjust = [hueAdjust valueForKey:@"outputImage"];
    
    // Get CGImage using CIImage
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage1 = [context createCGImage:outputHueAdjust
                                        fromRect:outputHueAdjust.extent];
    
    // Get UIImage using CGImage
    UIImage *outputImage = [UIImage imageWithCGImage:cgImage1];
    CGImageRelease(cgImage1);
    return outputImage;
}

// Rotates the source image by the specified angle in radians.
+ (UIImage *)straightenImage:(UIImage *)image
{
    CIImage *main = [[CIImage alloc] initWithImage:image];
    
    CIFilter *straightenFilter = [CIFilter filterWithName:@"CIStraightenFilter"];
    [straightenFilter setDefaults];
    [straightenFilter setValue:main forKey:@"inputImage"];
    [straightenFilter setValue:[NSNumber numberWithFloat:3.14f] forKey:@"inputAngle"];
    
    CIImage *outputStraignten = [straightenFilter valueForKey:@"outputImage"];
    
    // Get CGImage using CIImage
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputStraignten
                                       fromRect:outputStraignten.extent];
    UIImage *outputImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return outputImage;
}

+ (UIImage *)findFaceInImage:(UIImage *)image
{
    CIImage *coreImage = [[CIImage alloc] initWithImage:image];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:@"CIDetectorTypeFace"
                                              context:context
                                              options:[NSDictionary dictionaryWithObjectsAndKeys:@"CIDetectorAccuracyHigh", @"CIDetectorAccuracy", nil]];
    NSArray *features = [detector featuresInImage:coreImage];
    if ([features count] > 0)
    {
       CIImage *faceImage = [coreImage imageByCroppingToRect:[[features lastObject] bounds]];
       UIImage *face = [UIImage imageWithCGImage:[context createCGImage:faceImage fromRect:faceImage.extent]];
        return face;
    }
    return nil;
}

@end
