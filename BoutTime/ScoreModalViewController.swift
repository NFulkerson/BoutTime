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
    
    var score: Int?
    var rounds: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let score = self.score, let rounds = self.rounds {
            scoreLabel.text = "\(score)/\(rounds)" 
        } else {
            scoreLabel.text = "Uh-oh"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissScoreModal() {
        dismiss(animated: true, completion: nil)
    }

}
