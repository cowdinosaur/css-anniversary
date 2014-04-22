//
//  CSAViewControllerRegistry.m
//  CommonwealthSecondaryAnniversary
//
//  Created by akmal abdul rahman on 22/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import "CSAViewControllerRegistry.h"

@implementation CSAViewControllerRegistry

+(UIViewController *)instantiateHeritageViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"HeritageStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

+(UIViewController *)instantiateGalleryViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GalleryStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

+(UIViewController *)instantiateExperiencesViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExperiencesStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

+(UIViewController *)instantiateQuizViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"QuizStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

+(UIViewController *)instantiateFactsViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FactsStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

+(UIViewController *)instantiatePongGameViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PongGameStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

+(UIViewController *)instantiateFlappyBirdGameViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FlappyBirdGameStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;

}


@end
