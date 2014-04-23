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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.resultLabel.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)wrongTapped:(id)sender {
    NSLog(@"Tapped wrong button");
    self.resultLabel.text = @"Wrong. Try again";
}

- (IBAction)correctTapped:(id)sender {
    NSLog(@"You are right");
    self.resultLabel.text = @"You are right!!!!";
}
@end
