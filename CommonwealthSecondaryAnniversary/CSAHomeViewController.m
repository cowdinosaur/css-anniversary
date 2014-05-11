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
@property UIDynamicAnimator *animator;
@property UIPushBehavior *flappyBirdFloat;
@property UIPushBehavior *pongFloat;

- (void)update;
@end

@implementation CSAHomeViewController

const float kFlappyBirdYPos = 350;
const float kPongYPos = 400;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.animator = [[UIDynamicAnimator alloc] init];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.flappyBirdButton, self.pongButton]];
    gravity.magnitude = 0.1;
    [self.animator addBehavior:gravity];
    
    self.flappyBirdFloat = [[UIPushBehavior alloc] initWithItems:@[self.flappyBirdButton] mode:UIPushBehaviorModeInstantaneous];
    self.flappyBirdFloat.pushDirection = CGVectorMake(0, -0.02);
    self.flappyBirdFloat.active = NO;
    [self.animator addBehavior:self.flappyBirdFloat];
    
    self.pongFloat = [[UIPushBehavior alloc] initWithItems:@[self.pongButton] mode:UIPushBehaviorModeInstantaneous];
    self.pongFloat.pushDirection = CGVectorMake(0, -0.05);
    self.pongFloat.active = NO;
    [self.animator addBehavior:self.pongFloat];

    
    UIDynamicBehavior *keepBalloonsUp = [[UIDynamicBehavior alloc] init];
    keepBalloonsUp.action = ^{ [self update]; };
    [self.animator addBehavior:keepBalloonsUp];
}

- (void)update
{
    if (self.flappyBirdButton.center.y > kFlappyBirdYPos) {
        self.flappyBirdFloat.active = YES;
    }
    if (self.pongButton.center.y > kPongYPos) {
        self.pongFloat.active = YES;
    }
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
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoQuiz:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateQuizViewController];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoFacts:(id)sender
{
    UIViewController *vc = [CSAViewControllerRegistry instantiateFactsViewController];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
