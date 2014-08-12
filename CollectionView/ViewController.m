//
//  ViewController.m
//  CollectionView
//
//  Created by thinkit  on 8/7/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickFlag:(id)sender
{
    UICollectionViewController *flagPicker = [[FlagPickerViewController alloc] initWithDelegate:self];
    [self presentViewController:flagPicker animated:YES completion:NULL];
}

#pragma mark - FlagPickerVieWControllerDelegate

- (void)flagPicker:(FlagPickerViewController *)flagPickerViewController didFinishPickFlag:(Flag *)flag;
{
    self.countryLabel.text = flag.name;
    self.countryFlag.image = flag.image;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Helper Methods

- (UIImage *)aspectFillImage:(UIImage *)image toSize:(CGSize)size
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

@end
