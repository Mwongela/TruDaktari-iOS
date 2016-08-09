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
    NSArray *_pickerData;
    
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation SearchViewController




- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self customSetup];
    
    _pickerData = @[@"Doctor", @"Health facility"];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
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

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
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
