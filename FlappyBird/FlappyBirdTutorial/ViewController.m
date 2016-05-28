//
//  ViewController.m
//  FlappyBirdTutorial
//
//  Created by TJ Maynes on 5/11/14.
//  Copyright (c) 2014 Fluxavision. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    highScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreSaved"];
    highScore.text = [NSString stringWithFormat:@"High Score: %li", (long)highScoreNumber];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
