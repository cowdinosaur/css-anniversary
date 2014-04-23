//
//  CSAHeritageSecondViewController.m
//  CommonwealthSecondaryAnniversary
//
//  Created by SSOE User on 23/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import "CSAHeritageSecondViewController.h"

@interface CSAHeritageSecondViewController ()

@end

@implementation CSAHeritageSecondViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender { [self.navigationController popViewControllerAnimated:YES];
}
@end
