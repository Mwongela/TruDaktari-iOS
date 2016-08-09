//
//  HelpViewController.m
//  TruDaktari
//
//  Created by ilabafrica on 08/08/2016.
//  Copyright © 2016 CoDeveloper. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customSetup];
    
    // Do any additional setup after loading the view.
}

-(void)customSetup
{
    SWRevealViewController *revealViewController = self. revealViewController;
    if(revealViewController){
        [self.revealButtonItem setTarget:revealViewController];
        [self.revealButtonItem setAction:@selector(revealToggle:)];
        [self.navigationController.navigationBar addGestureRecognizer:revealViewController.panGestureRecognizer];
    }
}


-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [super encodeRestorableStateWithCoder:coder];
}


-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [super encodeRestorableStateWithCoder:coder];
}


-(void)applicationFinishedRestoringState
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self customSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
