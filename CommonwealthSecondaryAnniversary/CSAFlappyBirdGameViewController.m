//
//  CSAFlappyBirdGameViewController.m
//  CommonwealthSecondaryAnniversary
//
//  Created by akmal abdul rahman on 23/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import "CSAFlappyBirdGameViewController.h"

@interface CSAFlappyBirdGameViewController ()
@property (strong, nonatomic) UIView *character ;
@property (strong, nonatomic) UIView *ground ;
@property (strong, nonatomic) NSMutableArray *scenery;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIPushBehavior *floatUP;
@property (nonatomic, assign) NSTimeInterval lastTime;
@end

@implementation CSAFlappyBirdGameViewController

const float scrollSpeed = 100;
const float KStructureMinHeight = 150;
const float KStructureMaxHeight = 300;
const float KGap = 150;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    
    self.scenery = [NSMutableArray array];
    
    UIImage *backgroundImage = [UIImage imageNamed:@ "flappybird_background"];
    UIImageView *backgroundView = [[ UIImageView alloc] initWithImage:backgroundImage];
    backgroundView.layer .magnificationFilter = kCAFilterNearest;
    backgroundView.frame = CGRectMake(0, self.view.bounds.size.height - 570, 320, 570);
    [self.view addSubview: backgroundView];
    
    
    UIImage *Ground = [ UIImage imageNamed:@ "Ground"];
    self.ground = [[UIImageView alloc] initWithImage:Ground];
    self.ground.layer.magnificationFilter = kCAFilterNearest;
    self.ground.frame = CGRectMake(0, self.view.bounds.size.height - 60, 640, 60 );
    [self.view addSubview:self.ground];
    
    [self.scenery addObject:self.ground];
    [self FoodAndDrinks];
    //add character
    self.character = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImage *CharacterImage = [UIImage imageNamed:@ "CssArrowPlane"];
    UIImageView *CharacterView = [[UIImageView alloc] initWithImage:CharacterImage];
    CharacterView.layer.magnificationFilter = kCAFilterNearest;
    CharacterView.frame = CGRectMake(-5, -5, 130, 90);
    [self.character addSubview:CharacterView];
    self.character.center = CGPointMake(50, self.view.bounds.size.height / 2);
    [self.view addSubview:self.character];
    
    //animator
    self.animator = [[UIDynamicAnimator alloc] init];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.character]];
    gravity.magnitude = 0.5 ;
    [self.animator addBehavior:gravity];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [self.view addGestureRecognizer: gesture];
    
    self.floatUP = [[UIPushBehavior alloc] initWithItems:@[self.character] mode:UIPushBehaviorModeInstantaneous];
    self.floatUP.pushDirection = CGVectorMake(0, -0.5);
    self.floatUP.active = NO;
    [self.animator addBehavior: self.floatUP];
    
    UIDynamicBehavior *scroll = [[UIDynamicBehavior alloc] init];
    scroll.action = ^{ [self update]; };
    [self.animator addBehavior:scroll];
    
    
}
- (void)alertView:(UIAlertView *)alerView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 0) {
        [self performSelector:@selector(reset) withObject:nil afterDelay:0.5];
    } else {
        [self quit:self];
    }

}
- (void)reset
{
    [self.animator removeAllBehaviors];
    
    self.ground.frame = CGRectMake(0, self.view.bounds.size.height - 60, 640, 60);
    
    self.character.center = CGPointMake(50, self.view.bounds.size.height / 2);
    
    for(UIView *view in [self.scenery reverseObjectEnumerator]){
        if (view != self.ground){
            [self.scenery removeObject:view];
            [view removeFromSuperview];
        }
    }
    [self FoodAndDrinks];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.character]];
    gravity.magnitude = 0.5;
    [self.animator addBehavior:gravity];
    
    self.floatUP = [[UIPushBehavior alloc] initWithItems:@[self.character] mode:UIPushBehaviorModeInstantaneous];
    self.floatUP.pushDirection = CGVectorMake(0, -0.5);
    self.floatUP.active = NO;
    [self.animator addBehavior: self.floatUP];
    
    UIDynamicBehavior *scroll = [[UIDynamicBehavior alloc] init];
    scroll.action = ^{ [self update]; };
    [self.animator addBehavior:scroll];
}
- (void)update
{
    NSTimeInterval deltaTime = self.animator.elapsedTime - self.lastTime;
    self.lastTime = self.animator.elapsedTime;
    
    CGFloat scrollstep = scrollSpeed * deltaTime;
    for (UIView *view in self.scenery)
    {
        view.center = CGPointMake(view.center.x -scrollstep, view.center.y);
    }
    for (UIView *view in self.scenery)
    {
        if (CGRectIntersectsRect(self.character.frame, view.frame))
        {
            [self.animator removeAllBehaviors];
            
            [[[UIAlertView alloc] initWithTitle:@ "Game Over" message:nil delegate:self cancelButtonTitle:@"Again" otherButtonTitles: @"Quit", nil] show];
            
            break;
        }
    }
    if (self.ground.frame.origin.x < -self.view.frame.size.width)
    {
        self.ground.center = CGPointMake(self.ground.center.x + self.view.frame.size.width, self.ground.center.y);
        
        for(UIView *view in [self.scenery reverseObjectEnumerator])
        {
            if (view.frame.origin.x + view.frame.size.width < 0)
            {
                [self.scenery removeObject:view];
                [view removeFromSuperview];
            }
        }
        [self FoodAndDrinks];
    }
}

- (void)tapped
{
    self.floatUP.active = YES;
}
- (void)FoodAndDrinks
{
    CGFloat x = self.view.frame.size.width * 1.5;
    CGFloat y = self.view.frame.size.height - KStructureMinHeight
    - arc4random_uniform(KStructureMaxHeight - KStructureMinHeight);
    
    //FoodsAndDrinks
    UIImage *Foodimage = [UIImage imageNamed:@ "CssIdea"];
    UIImageView *FoodView = [[UIImageView alloc] initWithImage:Foodimage];
    FoodView.layer.magnificationFilter = kCAFilterNearest;
    FoodView.frame = CGRectMake(x-40, y, 80, 570);
    [self.view insertSubview:FoodView belowSubview:self.ground];
    [self.scenery addObject:FoodView];
    
    UIView *Drinks = [[UIView alloc] initWithFrame:CGRectMake(x - 50, y - 560 - 150, 100, 560)];
    UIImage *drinksImage = [UIImage imageNamed:@"drinks"];
    UIImageView *drinksview = [[UIImageView alloc] initWithImage: drinksImage];
    drinksview.layer.magnificationFilter = kCAFilterNearest;
    drinksview.frame = CGRectMake(Drinks.frame.size.width -240 / 2, 0, 240, 570);
    [Drinks addSubview: drinksview];
    [self.view addSubview:Drinks];
    [self.scenery addObject:Drinks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quit:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



@end
