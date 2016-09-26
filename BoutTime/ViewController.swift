//
//  ViewController.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 9/22/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelCollection: [UILabel]!
    
    // Game tracking variables
    var score: Int = 0
    var rounds: Int = 6
    var questionsAsked: Int = 0
    var askedIndexes: [Int] = []
    
    @IBAction func moveLabelDown(_ sender: UIButton) {
        print("Label at \(sender.tag) should move down.")
        // TODO: Factor this out into a wrapper function.
        swap(&labelCollection[sender.tag].text, &labelCollection[sender.tag + 1].text)
    }
    
    @IBAction func moveLabelUp(_ sender: UIButton) {
        print("Label at \(sender.tag) should move up.")
        swap(&labelCollection[sender.tag].text, &labelCollection[sender.tag - 1].text)
    }
    // TODO: Proper error handling
    func checkAnswers() {
        guard let label1 = labelCollection[0].text,
            let label2 = labelCollection[1].text,
            let label3 = labelCollection[2].text,
            let label4 = labelCollection[3].text
        else {
            print("Whoops!")
            return
        }
        // TODO: Should check timestamp instead of label
        if label1 <= label2 && label2 <= label3 && label3 <= label4 {
            score += 1
        } else {
            print("WRONG!")
        }
        print(score)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }

    // Helper Methods
    func nextRound() {
        // Checking equality here can lead to an endless loop of questions, if you
        // abuse the checkAnswer function.
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
        askedIndexes = []
        questionsAsked = 0
        score = 0
    }
    
    func alreadyAskedQuestion(questionIndex: Int) -> Bool {
        return askedIndexes.contains(questionIndex)
    }
    
}

