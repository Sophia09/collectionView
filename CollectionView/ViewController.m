//
//  ViewController.m
//  CollectionView
//
//  Created by thinkit  on 8/7/14.
//
//

#import "ViewController.h"
#import "ImageUtil.h"

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
    self.countryFlag.image = [ImageUtil straightenImage:flag.image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
