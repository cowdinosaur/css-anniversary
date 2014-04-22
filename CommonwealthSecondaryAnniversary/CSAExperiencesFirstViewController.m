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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
