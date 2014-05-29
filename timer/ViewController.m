//
//  ViewController.m
//  timer
//
//  Created by Admin on 14.04.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timerLabel;
@synthesize progressBar;
@synthesize numberSets;




-(void) progressBarRun
{  //barTime = (myTime);
    /**
    progressBar.progress -=(1/((barTime)*100));
     */
    //[self startTimer];
    progressBar.progress -=step;
    if (progressBar.progress ==0)
    {
    [theTimer2 invalidate];
    theTimer2 = nil;
    
    }

}








- (void) countDown


{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:myTime];
    
    
    
   
    [dateFormatter setDateFormat:@"mm:ss"];
    NSString *s1 = [dateFormatter stringFromDate:date];
    NSLog(@"Вывод: %@", s1);
    timerLabel.text = [NSString stringWithFormat:@"%@", s1];    // Вывод: 2001-01-02 at 13:00
    
    
    
    
    //timerLabel.text = [NSString stringWithFormat:@"%i:%i", myTime/60,myTime%60];
    if (myTime != 0)
   myTime--;
   
    
}

-(void) startTimer
{   [theTimer2 invalidate];
    theTimer2 = nil;
   
    step=1/curentSecond;
    NSLog(@"step=%f",step);
      NSLog(@"BarTime=%i",myTime);
    progressBar.progress=step*(myTime);
    step=step/100;
    theTimer2 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progressBarRun) userInfo:nil repeats:YES];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    Sets = 1;
   // timerLabel.text = [NSString stringWithFormat:@"%i:%i", myTime/60,myTime];
    /*_mybutton.layer.borderWidth = .5f;
    _mybutton.layer.borderColor = [[UIColor blackColor]CGColor];
    
    
    _mybutton.layer.masksToBounds = true;
    _mybutton.layer.cornerRadius = 40;
   */
    // Notice cap insets are different from above
    
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttomDecTime
{if (!(myTime == 0))
 {    if (myTime>30)
   {   barTime -=30;
    myTime = (myTime - 30);
   // maxTime -=30;
    //progressBar.progress=(barTime/maxTime);
    curentSecond-=30;
    //progressBar.progress=(barTime/maxTime);
    [self startTimer];
    
   }
//if (!theTimer)
// timerLabel.text = [NSString stringWithFormat:@"%i",myTime];
//theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
 }
}

- (IBAction)buttomIncTime
{ if (!(myTime == 0))
    {
    barTime +=30;
    myTime = (myTime + 30);
    //maxTime +=30;
    curentSecond+=30;
    //progressBar.progress=(barTime/maxTime);
    [self startTimer];
     }
    
    
    
  //  if (!theTimer)
   //     timerLabel.text = [NSString stringWithFormat:@"%i",myTime];
   //     theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (IBAction)buttomReset
{ if (myTime != 0)
  {
    myTime = 0;
    curentSecond =0;
    progressBar.progress =  1;
    [self countDown];
    [theTimer invalidate];
    theTimer = nil;
    [theTimer2 invalidate];
    theTimer2 = nil;
      Sets++;
    numberSets.text = [NSString stringWithFormat:@"%i", Sets];
  }
    else
   { Sets = 1;
       numberSets.text = [NSString stringWithFormat:@"%i", Sets];}
    
}


- (IBAction)num:(id)sender
{
    NSLog(@"%i",[sender tag]);
    
       curentSecond= myTime = [sender tag];
        [theTimer invalidate];
        theTimer = nil;
        
        theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [self startTimer];}







@end
