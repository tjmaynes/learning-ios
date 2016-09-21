//
//  GameViewController.swift
//  Swiftris
//
//  Created by TJ Maynes on 8/22/16.
//  Copyright (c) 2016 TJ Maynes, Inc. All rights reserved.
//

import UIKit
import QuartzCore
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()

        let skView = view as! SKView
        skView.multipleTouchEnabled = false

        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill

        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }



}
