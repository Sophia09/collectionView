//
//  FlagPickerViewController.m
//  CollectionView
//
//  Created by thinkit  on 8/11/14.
//
//

#import "FlagPickerViewController.h"
#import "FlagCell.h"
#import "ContinentHeader.h"

@interface FlagPickerViewController ()

@end

@implementation FlagPickerViewController

- (id)initWithDelegate:(id<FlagPickerVieWControllerDelegate>)delegate
{
    // Using a multicolumn layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    if (self = [super initWithCollectionViewLayout:layout])
    {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    africanFlags = [NSArray arrayWithObjects:
                    [[Flag alloc] initWithName:@"Ghana" imageName:@"Ghana"],
                    [[Flag alloc] initWithName:@"Kenya" imageName:@"Kenya"],
                    [[Flag alloc] initWithName:@"Morocco" imageName:@"Morocco"],
                    [[Flag alloc] initWithName:@"Mozambique" imageName:@"Mozambique"],
                    [[Flag alloc] initWithName:@"Rwanda" imageName:@"Rwanda"],
                    [[Flag alloc] initWithName:@"South Africa" imageName:@"South_Africa"],
                    nil];
    asianFlags = [NSArray arrayWithObjects:
                  [[Flag alloc] initWithName:@"China" imageName:@"China"],
                  [[Flag alloc] initWithName:@"India" imageName:@"India"],
                  [[Flag alloc] initWithName:@"Japan" imageName:@"Japan"],
                  [[Flag alloc] initWithName:@"Mongolia" imageName:@"Mongolia"],
                  [[Flag alloc] initWithName:@"Russia" imageName:@"Russia"],
                  [[Flag alloc] initWithName:@"Turkey" imageName:@"Turkey"],
                  nil];
    australasianFlags = [NSArray arrayWithObjects:
                         [[Flag alloc] initWithName:@"Australia" imageName:@"Australia"],
                         [[Flag alloc] initWithName:@"New Zealand" imageName:@"New_Zealand"],
                         nil];
    europeanFlags = [NSArray arrayWithObjects:
                     [[Flag alloc] initWithName:@"France" imageName:@"France"],
                     [[Flag alloc] initWithName:@"Germany" imageName:@"Germany"],
                     [[Flag alloc] initWithName:@"Iceland" imageName:@"Iceland"],
                     [[Flag alloc] initWithName:@"Ireland" imageName:@"Ireland"],
                     [[Flag alloc] initWithName:@"Italy" imageName:@"Italy"],
                     [[Flag alloc] initWithName:@"Poland" imageName:@"Poland"],
                     [[Flag alloc] initWithName:@"Russia" imageName:@"Russia"],
                     [[Flag alloc] initWithName:@"Spain" imageName:@"Spain"],
                     [[Flag alloc] initWithName:@"Sweden" imageName:@"Sweden"],
                     [[Flag alloc] initWithName:@"Turkey" imageName:@"Turkey"],
                     [[Flag alloc] initWithName:@"United Kingdom" imageName:@"United_Kingdom"],
                     nil];
    northAmericanFlags = [NSArray arrayWithObjects:
                          [[Flag alloc] initWithName:@"Canada" imageName:@"Canada"],
                          [[Flag alloc] initWithName:@"Mexico" imageName:@"Mexico"],
                          [[Flag alloc] initWithName:@"United States" imageName:@"United_States"],
                          nil];
    southAmericanFlags = [NSArray arrayWithObjects:
                          [[Flag alloc] initWithName:@"Argentina" imageName:@"Argentina"],
                          [[Flag alloc] initWithName:@"Brazil" imageName:@"Brazil"],
                          [[Flag alloc] initWithName:@"Chile" imageName:@"Chile"],
                          nil];
    
    // Register FlagCell and ContinentHeader with collection view
    [self.collectionView registerClass:[FlagCell class]
            forCellWithReuseIdentifier:@"FlagCell"];
    [self.collectionView registerClass:[ContinentHeader class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"ContinentHeader"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return africanFlags.count;
            
        case 1:
            return asianFlags.count;
            
        case 2:
            return australasianFlags.count;
            
        case 3:
            return europeanFlags.count;
            
        case 4:
            return northAmericanFlags.count;
            
        case 5:
            return southAmericanFlags.count;
            
        default:
            return 0;
    }
}


#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlagCell"
                                                               forIndexPath:indexPath];
    Flag *flag = [self flagForIndexPath:indexPath];
    cell.nameLabel.text = flag.name;
    cell.flagImageView.image = flag.image;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ContinentHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ContinentHeader" forIndexPath:indexPath];
    headerView.label.text = [self nameForSection:indexPath.section];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Flag *selectedFlag = [self flagForIndexPath:indexPath];
    [self.delegate flagPicker:self didFinishPickFlag:selectedFlag];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)
collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 75);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)
collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(50, 50);
}

#pragma mark - Helper Method

- (Flag *)flagForIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return [africanFlags objectAtIndex:indexPath.row];
            
        case 1:
            return [asianFlags objectAtIndex:indexPath.row];
            
        case 2:
            return [australasianFlags objectAtIndex:indexPath.row];
            
        case 3:
            return [europeanFlags objectAtIndex:indexPath.row];
            
        case 4:
            return [northAmericanFlags objectAtIndex:indexPath.row];
            
        case 5:
            return [southAmericanFlags objectAtIndex:indexPath.row];
            
        default:
            return nil;
    }
}

- (NSString *)nameForSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"African Flags";
        case 1:
            return @"Asian Flags";
        case 2:
            return @"Australasian Flags";
        case 3:
            return @"European Flags";
        case 4:
            return @"North American Flags";
        case 5:
            return @"South American Flags";
        default:
            return @"Unknown";
    }
}

@end
