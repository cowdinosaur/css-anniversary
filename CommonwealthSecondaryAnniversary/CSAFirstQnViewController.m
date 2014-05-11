//
//  CSAFirstQnViewController.m
//  CwssquizAA
//
//  Created by SSOE User on 9/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import "CSAFirstQnViewController.h"

@interface CSAFirstQnViewController ()

@end

@implementation CSAFirstQnViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.resultLabel.text = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)wrongTapped:(id)sender {
    self.resultLabel.text = @"Wrong. Try again";
}

- (IBAction)correctTapped:(id)sender {
    self.resultLabel.text = @"You are right!!!!";
}

- (IBAction)goHome:(id)sender {
    
    NSArray *vcs = self.navigationController.viewControllers;
    [self.navigationController setViewControllers:@[[vcs objectAtIndex:0], [vcs objectAtIndex:1] ]animated:YES];
}
@end
