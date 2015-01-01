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
    var runningTimer = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shakeLabel.text = initText
        // Do any additional setup after loading the view, typically from a nib.
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
            if(runningTimer == false) {
                self.shakeLabel.text = "Stop Shaking Me"
                self.shakeLabel.textColor = getRandomColor()
                // starts the timer
                NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
                runningTimer = true
            }
        }
    }
    
    func update () {
        runningTimer = false
        self.shakeLabel.text = initText
    }
    
    func getRandomColor() -> UIColor {
        var red:CGFloat = CGFloat(drand48())
        var green:CGFloat = CGFloat(drand48())
        var blue:CGFloat = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }


}
