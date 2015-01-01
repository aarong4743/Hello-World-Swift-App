//
//  ViewController.swift
//  Hello World
//
//  Created by Aaron Graham on 1/1/15.
//  Copyright (c) 2015 Aaron Graham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shakeLabel: UILabel!
    
    var initText = "Shake to find out your future"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.shakeLabel.text = initText
        //-----------up swipe gestures in view--------------//
        let swipeUp = UISwipeGestureRecognizer(target: self, action: Selector("upSwiped"))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            self.shakeLabel.text = "Stop Shaking Me"
            self.shakeLabel.textColor = getRandomColor()
        }
    }

    
    func upSwiped()
    {
        println("Up swiped ")
        self.shakeLabel.text = initText
        self.shakeLabel.textColor = UIColor.blackColor()
    }
    
    
    func getRandomColor() -> UIColor {
        var red:CGFloat = CGFloat(drand48())
        var green:CGFloat = CGFloat(drand48())
        var blue:CGFloat = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }


}
