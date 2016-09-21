//
//  GameScene.swift
//  Swiftris
//
//  Created by TJ Maynes on 8/22/16.
//  Copyright © 2016 TJ Maynes, Inc. All rights reserved.
//

import SpriteKit

let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {

    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick: NSDate?

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    override init(size: CGSize) {
        super.init(size: size)

        anchorPoint = CGPoint(x: 0, y: 10)

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(background)
    }

    override func update(currentTime: CFTimeInterval) {
        guard let lastTick = lastTick else {
            return
        }

        let timePassed = lastTick.timeIntervalSinceNow * -1000.0

        if timePassed > tickLengthMillis {
            self.lastTick = NSDate()
            tick?()
        }
    }

    func startTicking() {
        lastTick = NSDate()
    }

    func stopTicking() {
        lastTick = nil
    }

}
