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

    var answers: [String] = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
    
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
            if(runningTimer == false) {
                self.shakeLabel.text = "Stop Shaking Me"
                self.shakeLabel.textColor = getRandomColor()
                // starts the timer
                NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
                runningTimer = true
                var rand = Int(arc4random_uniform(20))
                self.shakeLabel.text = answers[rand]
            }
        }
    }
    
    func upSwiped()
    {
        NSLog("Up swiped ")
    }
    
    
    func getRandomColor() -> UIColor {
        var red:CGFloat = CGFloat(drand48())
        var green:CGFloat = CGFloat(drand48())
        var blue:CGFloat = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }


}
