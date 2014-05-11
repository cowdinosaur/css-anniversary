//
//  CSAPongGameViewController.m
//  PongDrew
//
//  Created by SSOE User on 5/3/14.
//  Copyright (c) 2014 SSOE User. All rights reserved.
//

#import "CSAPongGameViewController.h"

@interface CSAPongGameViewController ()
@property (nonatomic) float enemyspeed;
@property (nonatomic) float ballSpeedX;
@property (nonatomic) float ballSpeedY;
@property NSInteger time;
@end

@implementation CSAPongGameViewController
static const float kEnemySpeedConstant = 5.0;
static const float kAnimationInterval = 1.0/50.0;
static const float kMaxWindowWidth = 320;
static const float kMinWindowWidth = 0;
static const float kMinWindowHeight = -1068;
static const float kMaxWindowHeight = 1068;
static const float kBallSpeedXConstant = 4.0;
static const float kBallSpeedYConstant = 4.0;
-(BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[NSTimer scheduledTimerWithTimeInterval:kAnimationInterval target:self selector:@selector(timerAnimate) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    self.enemyspeed = kEnemySpeedConstant;
    self.ballSpeedX = kBallSpeedXConstant;
    self.ballSpeedY = kBallSpeedYConstant;
    self.time = 0;
}

- (void)timerUpdate
{
    self.time = self.time + 1;
    self.timerlabel.text = [NSString stringWithFormat:@"%d", self.time];
}

- (void)timerAnimate
{
    [self animateEnemy];
    [self animateBall];
}
- (void)animateBall
{
    CGPoint ballPoint = self.Ball.center;
    CGSize ballSize = self.Ball.frame.size;
    
    if (self.ballSpeedX > 0 && (ballPoint.x + ballSize.width/2) > kMaxWindowWidth) {
        self.ballSpeedX = -kBallSpeedXConstant;
    } else if (self.ballSpeedX < 0 && (ballPoint.x - ballSize.width/2) < kMinWindowWidth ) {
        self.ballSpeedX = kBallSpeedXConstant;
    }
    if (self.ballSpeedY > 0 && (ballPoint.y + ballSize.height/2 ) > kMaxWindowHeight ) {
        self.ballSpeedY = -kBallSpeedYConstant;
    } else if (self.ballSpeedY < 0 && (ballPoint.y - ballSize.height/2) < kMinWindowHeight) {
        self.ballSpeedY = kBallSpeedYConstant;
    }
    
    if (CGRectIntersectsRect(self.Ball.frame, self.PlayerPaddle.frame) || CGRectIntersectsRect(self.Ball.frame, self.AIPaddle.frame)) {
        self.ballSpeedY = -self.ballSpeedY;
    }
    
    self.Ball.center = CGPointMake(ballPoint.x + self.ballSpeedX, ballPoint.y + self.ballSpeedY);
    if (ballPoint.y > 568){
        NSString *title = [NSString stringWithFormat:@"Time: %d", self.time];
        [[[UIAlertView alloc] initWithTitle:title message:@"GameOver" delegate:self cancelButtonTitle:@"Restart" otherButtonTitles: @"Quit", nil] show];
        self.ballSpeedX = 0;
        self.ballSpeedY = 0;
        self.Ball.center = CGPointMake(160,100);
    }
    
}

-(void)animateEnemy
{
    CGPoint paddlePoint = self.AIPaddle.center;
    CGSize paddleSize = self.AIPaddle.frame.size;
    
    if (self.enemyspeed > 0 && (paddlePoint.x + paddleSize.width/2) > kMaxWindowWidth) {
        //NSLog(@"Turning left");
        self.enemyspeed = - kEnemySpeedConstant;
    } else if (self.enemyspeed < 0 && (paddlePoint.x - paddleSize.width/2) < kMinWindowWidth) {
        //NSLog(@"Turning right");
        self.enemyspeed = kEnemySpeedConstant;
    }
    self.AIPaddle.center = CGPointMake(paddlePoint.x + self.enemyspeed, paddlePoint.y);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint touchPoint = [touch locationInView:self.view];
        self.PlayerPaddle.center= CGPointMake(touchPoint.x, self.PlayerPaddle.center.y);
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
    
    
    if (CGRectIntersectsRect(self.Ball.frame, self.PlayerPaddle.frame) || CGRectIntersectsRect(self.Ball.frame, self.AIPaddle.frame)) { self.ballSpeedY = -self.ballSpeedY;
    }
}

- (IBAction)quit:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        self.ballSpeedX = kBallSpeedXConstant;
        self.ballSpeedY = kBallSpeedYConstant;
        self.time = 0;
    } else {
        [self quit:self];
    }
}

@end
