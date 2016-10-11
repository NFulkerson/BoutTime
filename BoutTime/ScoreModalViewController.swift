//
//  ScoreModalViewController.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 10/4/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit

class ScoreModalViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    // These properties will be set by the main ViewController
    // when the game ends.
    var score: Int?
    var rounds: Int?
    var sender: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // chain optional unwrapping. If for some reason our view can't pass
        // the necessary score data, or we reach the view in some unexpected way
        // at least we won't crash by trying to access data in these properties.
        if let score = self.score, let rounds = self.rounds {
            scoreLabel.text = "\(score)/\(rounds)" 
        } else {
            scoreLabel.text = "Uh-oh, something went wrong."
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissScoreModal() {
        dismiss(animated: true, completion: nil)
        // This allows us to reach a reference back to our main view controller
        // Which then permits us to call playAgain, which function is more relevant
        // to the game view than our score view.
        // A better app would likely seperate game logic into its own controller or model, seperate from the view.
        if let vc = sender as? ViewController {
            vc.playAgain()
        }
    }

}
