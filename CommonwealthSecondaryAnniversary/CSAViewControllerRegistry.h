//
//  CSAViewControllerRegistry.h
//  CommonwealthSecondaryAnniversary
//
//  Created by akmal abdul rahman on 22/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSAViewControllerRegistry : NSObject

+(UIViewController *)instantiateHeritageViewController;
+(UIViewController *)instantiateGalleryViewController;
+(UIViewController *)instantiateExperiencesViewController;
+(UIViewController *)instantiateQuizViewController;
+(UIViewController *)instantiateFactsViewController;
+(UIViewController *)instantiatePongGameViewController;
+(UIViewController *)instantiateFlappyBirdGameViewController;

@end
