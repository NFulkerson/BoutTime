//
//  ViewController.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 9/22/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit
import GameKit
import SafariServices

class ViewController: UIViewController {
    
    // MARK: - IBOutlets and Variables

    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var gameTimerLabel: UILabel!
    // Game tracking variables
    var score: Int = 0
    var rounds: Int = 6
    var questionsAsked: Int = 0
    var presentedEvents: [Event] = []
    var timeToAnswer: Int = 60
    let eventsList = EventData()

    var clock = Timer()
    
    // MARK: - UI Interactions, Gestures
    
    @IBAction func moveLabelDown(_ sender: UIButton) {
        // TODO: Needs to handle cases in which presentedEvents is empty, for whatever reason
        // we swap positions of events in the array at an index indicated by the sender's IB tag
        // which ranges from 0 to 3, each correlated with
        // the label's position in the interface.
        swap(&presentedEvents[sender.tag], &presentedEvents[sender.tag + 1])
        // we then go over each label and update its text to properly match the new indexes.
        // Since we are dealing with a very small subset of items, this isn't an issue
        // We could likely refactor it to only deal with the values that were swapped,
        // but this way ensures clean state.
        setupLabels()
    }
    
    @IBAction func moveLabelUp(_ sender: UIButton) {
        // identical to moveLabelDown, but inverted. May be a good case for refactor.
        swap(&presentedEvents[sender.tag], &presentedEvents[sender.tag - 1])
        setupLabels()
    }
    
    @IBAction func nextRound() {
        // Checking equality here can lead to an endless loop of questions, if you
        // abuse the checkAnswer function.
        toggleLabelTouch()
        resetEvents()
        nextRoundButton.isHidden = true
        if questionsAsked >= rounds {
            // Game is over
            print("Game has ended.")
            print("Initiate segue.")
            performSegue(withIdentifier: "showScoreModalSegue", sender: self)
        } else {
            // Continue game
            setupChallenge()
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            endTimer()
            checkAnswers()
        default:
            print("\(motion) ended. Event: \(event)")
        }
    }
    
    // MARK: - Standard View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextRoundButton.isHidden = true
        setupChallenge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing to segue to \(segue)")
        if segue.identifier == "showScoreModalSegue" {
            if let scoreView = segue.destination as? ScoreModalViewController {
                // set destination view's properties, so the view can set up
                scoreView.score = score
                scoreView.rounds = rounds
                // we're going to pass along a reference to this view controller
                // so that we can call the 'play again' function in this class
                // from the modal view. It doesn't make sense to have the resets
                // take place in the modal view. It's simply for telling scores.
                // This is also necessary because my original 'trick'--calling 'playAgain'
                // before presenting the modal--starts the timer even though the game view
                // isn't being interacted with or even viewed.
                scoreView.sender = sender
            }
        }
    }
    
    // MARK: - Helpers
    func startTimer() {
        clock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if timeToAnswer <= 0 {
            endTimer()
            checkAnswers()
        }
        timeToAnswer -= 1
        let time = secondsToMinutesSeconds(seconds: timeToAnswer)
        // This is an ugly and unclear way to do it, but the former uses string interpolation
        // which is then appended by a string with a leading zero format.
        gameTimerLabel.text = "\(time.minutes):" + String(format: "%02d", time.seconds)
    }
    
    func endTimer() {
        clock.invalidate()
        resetClock()
    }
    
    func secondsToMinutesSeconds(seconds:Int) -> (minutes: Int, seconds: Int) {
        // this nifty bit of math taken from
        // http://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
        return (minutes: (seconds % 3600) / 60, seconds: seconds % 60)
    }
    
    func checkAnswers() {
        // TODO: Refactoring.
        print("\(presentedEvents)")
        if presentedEvents[0].eventDate <= presentedEvents[1].eventDate &&
            presentedEvents[1].eventDate <= presentedEvents[2].eventDate &&
            presentedEvents[2].eventDate <= presentedEvents[3].eventDate {
            score += 1
            nextRoundButton.setImage(UIImage(named: "next_round_success.png"), for: .normal)
        } else {
            nextRoundButton.setImage(UIImage(named: "next_round_fail.png"), for: .normal)
        }
        toggleLabelTouch()
        nextRoundButton.isHidden = false
        // TODO: Remove after debugging.
        print(score)
    }
    
    // TODO: Implement timer.
    
    func displayScore() {
        print("Total score is \(score) out of \(rounds)")
    }
    
    // This function is responsible for all setup pertaining to a round
    func setupChallenge() {
        questionsAsked += 1
        gameTimerLabel.text = "1:00"
        retrieveEvents()
        setupLabels()
        startTimer()
    }
    // This function, as you can guess, retrieves events from the eventsList object.
    // It retrieves four at a time to be presented in the view
    func retrieveEvents() {
        while presentedEvents.count < 4 {
            var event = eventsList.getRandomEvent()
            if presentedEvents.contains(event) {
                // if a retrieved event has already been presented, we don't want to append it.
                // we want to loop over until we get a unique one.
                while presentedEvents.contains(event) {
                    event = eventsList.getRandomEvent()
                }
            }
            presentedEvents.append(event)
        }
        // TODO: Remove after debugging.
        print(presentedEvents)
    }
    
    
    func setupLabels() {
        var eventIndex = 0
        // iterate over labels
        for label in labelCollection {
            // assign an event with a corresponding index to a label's text.
            label.text = presentedEvents[eventIndex].title
            // increment event counter, so that the label index and event index match.
            eventIndex += 1
        }
    }
    
    func playAgain() {
        // remove all events from the presented array
        resetEvents()
        score = 0
        questionsAsked = 0
        setupChallenge()
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        if let label = sender.view as? UILabel {
            print(label.text!)
            if let i = presentedEvents.index(where: {
                $0.title == label.text!
            }) {
                print(presentedEvents[i].eventInfoURI)
                print("Loading url...")
                if let infoURL = URL(string: presentedEvents[i].eventInfoURI) {
                    presentInfoView(url: infoURL)
                }
                
            }
        }
    }
    
    func presentInfoView(url: URL) {
        let webInfoView = SFSafariViewController(url: url)
        self.present(webInfoView, animated: true, completion: nil)
    }
    
    
    // We need this functionality both when we start a round and a new game
    // So let's just separate it into a helper for clarity.
    func resetEvents() {
        // if we don't clear the presented event array, the questions won't change,
        // due to the implementation of the retrieveEvents method.
        presentedEvents.removeAll()
    }
    // Like the above function, we could have just put this code into other functions,
    // but suppose we have a 'lightning round' or other variations of time limit?
    // this is a bit more flexible.
    func resetClock() {
        timeToAnswer = 60
    }
    
    func toggleLabelTouch() {
        for label in labelCollection {
            print(label.text)
            let enabledStatus = label.isUserInteractionEnabled
            switch enabledStatus {
            case true:
                print("Touch enabled. Disabling.")
            case false:
                print("Touch disabled. Enabling.")
            }
            label.isUserInteractionEnabled = !enabledStatus
        }
    }
    
}

