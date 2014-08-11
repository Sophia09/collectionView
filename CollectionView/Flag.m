//
//  Flag.m
//  CollectionView
//
//  Created by thinkit  on 8/7/14.
//
//

#import "Flag.h"

@interface Flag()

@end

@implementation Flag

- (id)initWithName:(NSString *)name imageName:(NSString *)imageName
{
    self = [super init];
    if (self)
    {
        self.name = name;
        NSString *imageFile = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        self.image = [[UIImage alloc] initWithContentsOfFile:imageFile];
    }
    return self;
}

@end
