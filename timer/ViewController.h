//
//  ViewController.h
//  timer
//
//  Created by Admin on 14.04.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSInteger myTime, Sets;
    double barTime, step, old_progress, curentSecond, maxTime;
    NSTimer *theTimer;
    NSTimer *theTimer2;
    
}
-(void) startTimer;

@property (strong, nonatomic) IBOutlet UILabel *numberSets;

- (IBAction)num:(id)sender;
- (IBAction)buttomDecTime;

- (IBAction)buttomIncTime;

- (IBAction)buttomReset;


@property (strong, nonatomic) IBOutlet UILabel *timerLabel;


@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;



@end
