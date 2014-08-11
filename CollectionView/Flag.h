//
//  Flag.h
//  CollectionView
//
//  Created by thinkit  on 8/7/14.
//
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;


- (id)initWithName:(NSString *)name imageName:(NSString *)imageName;

@end
