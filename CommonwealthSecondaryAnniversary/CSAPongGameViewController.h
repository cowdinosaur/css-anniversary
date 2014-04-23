//
//  CSAPongGameViewController.h
//  PongDrew
//
//  Created by SSOE User on 5/3/14.
//  Copyright (c) 2014 SSOE User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSAPongGameViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *PlayerPaddle;
@property (weak, nonatomic) IBOutlet UIView *AIPaddle;
@property (weak, nonatomic) IBOutlet UIView *Ball;
- (IBAction)quit:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timerlabel;



@end
