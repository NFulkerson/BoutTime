//
//  TimerLabelViewController.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 10/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit

class TimerLabelViewController: UIViewController {
    
    @IBOutlet weak var gameTimerLabel: UILabel!
    var timer: Timer = Timer()
    var timeToAnswer: Int = 60

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if self.timeToAnswer <= 0 {
            endTimer()
            parent.checkAnswers()
        }
        timeToAnswer -= 1
        let time = secondsToMinutesSeconds(seconds: timeToAnswer)
        clockManager.updateTimerLabels(minutes: time.minutes, seconds: time.seconds)
        
    }
    
    
    func secondsToMinutesSeconds(seconds:Int) -> (minutes: Int, seconds: Int) {
        // this nifty bit of math taken from
        // http://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
        return (minutes: (seconds % 3600) / 60, seconds: seconds % 60)
    }
    
    func endTimer() {
        timer.invalidate()
        resetTimeToAnswer()
    }
    
    func resetTimeToAnswer() {
        timeToAnswer = 60
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
