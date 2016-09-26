//
//  ViewController.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 9/22/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    @IBOutlet var labelCollection: [UILabel]!
    
    @IBOutlet weak var gameTimerLabel: UILabel!
    // Game tracking variables
    var score: Int = 0
    var rounds: Int = 6
    var questionsAsked: Int = 0
    var presentedEvents: [Event] = []
    var timeToAnswer: Int = 60
    let eventsList = EventData()
    
    @IBAction func moveLabelDown(_ sender: UIButton) {
        // TODO: Needs to handle cases in which presentedEvents is empty, for whatever reason
        // we swap positions of events in the array at an index indicated by the sender's IB tag
        // which ranges from 0 to 3, each correlated with
        // the label's position in the interface.
        swap(&presentedEvents[sender.tag], &presentedEvents[sender.tag + 1])
        // we then go over each label and update its text to properly match the new indexes.
        // Since we are dealing with a very small subset of items, this isn't an issue
        // We could likely refactor it to only deal with the values that were swapped,
        // but this prevents things from going totally out of sync.
        setupLabels()
    }
    
    @IBAction func moveLabelUp(_ sender: UIButton) {
        // identical to moveLabelDown, but inverted. May be a good case for refactor.
        swap(&presentedEvents[sender.tag], &presentedEvents[sender.tag - 1])
        setupLabels()
    }
    // TODO: Proper error handling
    func checkAnswers() {
        // TODO: Refactoring.
        if presentedEvents[0].eventDate <= presentedEvents[1].eventDate &&
            presentedEvents[1].eventDate <= presentedEvents[2].eventDate &&
            presentedEvents[2].eventDate <= presentedEvents[3].eventDate {
            score += 1
        }
        print(score)
    }
    
    // TODO: Implement timer.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupChallenge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            checkAnswers()
        default:
            print("\(motion) ended. Event: \(event)")
        }
    }
    
    func displayScore() {
        print("Total score is \(score) out of \(rounds)")
    }
    
    func setupChallenge() {
        // TODO: Placeholder for label setup.
        retrieveEvents()
        setupLabels()
    }

    // Helper Methods
    func retrieveEvents() {
        while presentedEvents.count < 4 {
            var event = eventsList.getRandomEvent()
            if presentedEvents.contains(event) {
                while presentedEvents.contains(event) {
                    event = eventsList.getRandomEvent()
                }
            }
            presentedEvents.append(event)
        }
        print(presentedEvents)
    }
    
    func setupLabels() {
        var eventIndex = 0
        for label in labelCollection {
            label.text = presentedEvents[eventIndex].title
            eventIndex += 1
        }
    }
    
    func nextRound() {
        // Checking equality here can lead to an endless loop of questions, if you
        // abuse the checkAnswer function.
        presentedEvents = []
        if questionsAsked >= rounds {
            // Game is over
            displayScore()
        } else {
            // Continue game
            setupChallenge()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        
        questionsAsked = 0
        score = 0
    }
    
    
}

