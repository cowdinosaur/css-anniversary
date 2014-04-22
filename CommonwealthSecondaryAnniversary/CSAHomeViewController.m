//
//  CSAHomeViewController.m
//  CommonwealthSecondaryAnniversary
//
//  Created by akmal abdul rahman on 22/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import "CSAHomeViewController.h"
#import "CSAViewControllerRegistry.h"

@interface CSAHomeViewController ()

@end

@implementation CSAHomeViewController

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

- (IBAction)gotoHeritage:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateHeritageViewController];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoGallery:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateGalleryViewController];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)gotoExperiences:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateExperiencesViewController];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoQuiz:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateQuizViewController];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoPongGame:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiatePongGameViewController];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)gotoFlappyBirdGame:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateFlappyBirdGameViewController];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
