//
//  ViewController.h
//  CollectionView
//
//  Created by thinkit  on 8/7/14.
//
//

#import <UIKit/UIKit.h>
#import "FlagPickerViewController.h"

@interface ViewController : UIViewController <FlagPickerVieWControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *countryFlag;

- (IBAction)pickFlag:(id)sender;

@end
