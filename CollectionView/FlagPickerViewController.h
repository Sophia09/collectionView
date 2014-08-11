//
//  FlagPickerViewController.h
//  CollectionView
//
//  Created by thinkit  on 8/11/14.
//
//

#import <UIKit/UIKit.h>
#import "Flag.h"

@class FlagPickerViewController;

@protocol FlagPickerVieWControllerDelegate <NSObject>

@required

- (void)flagPicker:(FlagPickerViewController *)flagPickerViewController didFinishPickFlag:(Flag *)flag;

@end

@interface FlagPickerViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    @private
    NSArray *africanFlags;
    NSArray *asianFlags;
    NSArray *australasianFlags;
    NSArray *europeanFlags;
    NSArray *northAmericanFlags;
    NSArray *southAmericanFlags;
}

@property (nonatomic, weak) id<FlagPickerVieWControllerDelegate> delegate;

- (id)initWithDelegate:(id<FlagPickerVieWControllerDelegate>)delegate;

@end
