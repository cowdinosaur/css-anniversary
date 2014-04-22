//
//  CSAFirstQnViewController.h
//  CwssquizAA
//
//  Created by SSOE User on 9/4/14.
//  Copyright (c) 2014 Tinkertanker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSAFirstQnViewController : UIViewController
- (IBAction)wrongTapped:(id)sender;
- (IBAction)correctTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end
