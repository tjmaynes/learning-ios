//
//  Game.m
//  FlappyBirdTutorial
//
//  Created by TJ Maynes on 5/11/14.
//  Copyright (c) 2014 Fluxavision. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

- (void) GameOver {
    if(scoreNumber > highScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreNumber forKey:@"highScoreSaved"];
    }
    
    [tunnelMovement invalidate];
    [birdMovement invalidate];
    
    startGame.hidden = YES;
    restartButton.hidden = NO;
    exitGame.hidden = NO;
    tunnelTop.hidden = YES;
    tunnelBottom.hidden = YES;
    bird.hidden = YES;
}

- (IBAction) StartGame {
    startGame.hidden = YES;
    restartButton.hidden = YES;
    exitGame.hidden = YES;
    tunnelTop.hidden = NO;
    tunnelBottom.hidden = NO;
    bird.hidden = NO;

    birdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];

    [self PlaceTunnels];
    
    tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMovement) userInfo:nil repeats:YES];
}

- (void) BirdMoving {
    bird.center = CGPointMake(bird.center.x, bird.center.y - birdFlight);
    birdFlight = birdFlight - 5;

    if(birdFlight < 15){
        birdFlight = -15;
    }

    if(birdFlight > 0){
        bird.image = [UIImage imageNamed:@"bird_up.png"];
    }

    if(birdFlight < 0){
        bird.image = [UIImage imageNamed:@"bird_down.png"];
    }
}

- (void) TunnelMovement {
    tunnelTop.center = CGPointMake(tunnelTop.center.x - 1, tunnelTop.center.y);
    tunnelBottom.center = CGPointMake(tunnelBottom.center.x - 1, tunnelBottom.center.y);
    
    if(tunnelTop.center.x < -55){
        [self PlaceTunnels];
    }
    
    if(tunnelTop.center.x == 30){
        [self Score];
    }
    
    if(CGRectIntersectsRect(bird.frame, tunnelTop.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(bird.frame, tunnelBottom.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(bird.frame, top.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(bird.frame, bottom.frame)){
        [self GameOver];
    }
}

- (void) PlaceTunnels {
    randomTopTunnelPosition = arc4random() % 350;
    randomTopTunnelPosition = randomTopTunnelPosition - 210;
    randomBottomTunnelPosition = randomTopTunnelPosition + 655;

    tunnelTop.center = CGPointMake(340, randomTopTunnelPosition);
    tunnelBottom.center = CGPointMake(340, randomBottomTunnelPosition);
    
}

- (void) Score {
    scoreNumber = scoreNumber + 1;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    birdFlight = 30;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    tunnelTop.hidden = YES;
    tunnelBottom.hidden = YES;
    
    startGame.hidden = NO;
    restartButton.hidden = YES;
    exitGame.hidden = YES;
    scoreNumber = 0;
    
    highScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreSaved"];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
