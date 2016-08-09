//
//  SearchViewController.m
//  TruDaktari
//
//  Created by ilabadmin on 8/3/16.
//  Copyright © 2016 CoDeveloper. All rights reserved.
//

#import "SearchViewController.h"
#import "UIDownPicker.h"
#import "DownPicker.h"

@interface SearchViewController (){
    UIDownPicker *_dp;
    
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;

//@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@end

@implementation SearchViewController


- (void)viewDidLoad
{
    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    [super viewDidLoad];
    [self customSetup];
    //_dp = [[UIDownPicker initWithData: germanMakes];
    //_dp = [[UIDownPicker] initWithData:germanMakes];
    [self.view addSubview:_dp];
    
}


- (void)customSetup
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButtonItem setTarget: revealViewController];
        [self.revealButtonItem setAction: @selector( revealToggle: )];
        [self.navigationController.navigationBar addGestureRecognizer:revealViewController.panGestureRecognizer];
    }
    
}


#pragma mark state preservation / restoration

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Save what you need here
    //[coder encodeObject: _text forKey: @"text"];
    //[coder encodeObject: _color forKey: @"color"];
    
    [super encodeRestorableStateWithCoder:coder];
}


- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [super decodeRestorableStateWithCoder:coder];
}


- (void)applicationFinishedRestoringState
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Call whatever function you need to visually restore
    [self customSetup];
}

@end
