//
//  ViewController.swift
//  DrawPad
//
//  Created by Jean-Pierre Distler on 13.11.14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false

    let colors: [(CGFloat, CGFloat, CGFloat)] = [
        (0,0,0),
        (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0),
        (1.0, 0, 0),
        (0, 0, 1.0),
        (51.0 / 255.0, 204.0 / 255.0, 1.0),
        (102.0 / 255.0, 204.0 / 255.0, 0),
        (102.0 / 255.0, 1.0, 0),
        (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0),
        (1.0, 102.0 / 255.0, 0),
        (1.0, 1.0, 0),
        (1.0, 1.0, 1.0),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.locationInView(self.view)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        // 1 = The first method is responsible for drawing a line between two points. Remember that this app has two image views – mainImageView (which holds the “drawing so far”) and tempImageView (which holds the “line you’re currently drawing”). Here you want to draw into tempImageView, so you need to set up a drawing context with the image currently in the tempImageView (which should be empty the first time).
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        // 2 = Next, you get the current touch point and then draw a line with CGContextAddLineToPoint from lastPoint to currentPoint. You might think that this approach will produce a series of straight lines and the result will look like a set of jagged lines. This will produce straight lines, but the touch events fire so quickly that the lines are short enough and the result will look like a nice smooth curve.
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        // 3 = Here are all the drawing parameters for brush size and opacity and brush stroke color.
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, brushWidth)
        CGContextSetRGBStrokeColor(context, red, green, blue, opacity)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        // 4 = This is where the magic happens, and where you actually draw the path!
        CGContextStrokePath(context)

        // 5 = Next, you need to wrap up the drawing context to render the new line into the temporary image view.
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 6 = In touchesMoved, you set swiped to true so you can keep track of whether there is a current swipe in progress. Since this is touchesMoved, the answer is yes, there is a swipe in progress! You then call the helper method you just wrote to draw the line.
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.locationInView(self.view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
            // 7 = Finally, you update the lastPoint so the next touch event will continue where you just left off.
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !swiped {
          drawLineFrom(lastPoint, toPoint: lastPoint)
        }

        // merge tempImageView into mainImageView
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        mainImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), blendMode:CGBlendMode.Normal, alpha: 1.0)
        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), blendMode:CGBlendMode.Normal, alpha: 1.0)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()

        tempImageView.image = nil

    }
    
    @IBAction func reset(sender: AnyObject) {
        mainImageView.image = nil
    }
    
    @IBAction func share(sender: AnyObject) {
        UIGraphicsBeginImageContext(mainImageView.bounds.size)
        mainImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: mainImageView.frame.size.width, height: mainImageView.frame.size.height))

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        presentViewController(activity, animated: true, completion: nil)
    }
    
    @IBAction func pencilPressed(sender: AnyObject) {
        var index = sender.tag ?? 0
        if index < 0 || index >= colors.count {
            index = 0
        }

        (red, green, blue) = colors[index] // tuples rock!

        if index == colors.count - 1 {
            opacity = 1.0
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let settingsViewController = segue.destinationViewController as! SettingsViewController

        settingsViewController.delegate = self
        settingsViewController.brush = brushWidth
        settingsViewController.opacity = opacity
        settingsViewController.red = red
        settingsViewController.green = green
        settingsViewController.blue = blue
    }
}

extension ViewController: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController) {
        self.brushWidth = settingsViewController.brush
        self.opacity = settingsViewController.opacity
        self.red = settingsViewController.red
        self.green = settingsViewController.green
        self.blue = settingsViewController.blue
    }
}
