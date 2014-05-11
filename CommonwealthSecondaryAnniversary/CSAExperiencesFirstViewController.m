//
//  CSAExperiencesFirstViewController.m
//  CommonwealthSecondaryAnniversary
//
//  Created by akmal abdul rahman on 22/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import "CSAExperiencesFirstViewController.h"

@interface CSAExperiencesFirstViewController ()

@end

@implementation CSAExperiencesFirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goHome:(id)sender {
    
    NSArray *vcs = self.navigationController.viewControllers;
    [self.navigationController setViewControllers:@[[vcs objectAtIndex:0], [vcs objectAtIndex:1] ]animated:YES];
}
@end
