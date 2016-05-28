//
//  Game.h
//  FlappyBirdTutorial
//
//  Created by TJ Maynes on 5/11/14.
//  Copyright (c) 2014 Fluxavision. All rights reserved.
//

#import <UIKit/UIKit.h>

int birdFlight;
int randomTopTunnelPosition;
int randomBottomTunnelPosition;
int scoreNumber;
NSInteger highScoreNumber;

@interface Game : UIViewController
{
    IBOutlet UIImageView *bird;
    IBOutlet UIButton *startGame;
    IBOutlet UIButton *exitGame;
    IBOutlet UIButton *restartButton;
    IBOutlet UIImageView *tunnelTop;
    IBOutlet UIImageView *tunnelBottom;
    IBOutlet UIImageView *top;
    IBOutlet UIImageView *bottom;
    IBOutlet UILabel *scoreLabel;
    
    NSTimer *birdMovement;
    NSTimer *tunnelMovement;
}

- (IBAction) StartGame;
- (void) BirdMoving;
- (void) TunnelMovement;
- (void) PlaceTunnels;
- (void) Score;
- (void) GameOver;

@end
