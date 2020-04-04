//
//  ViewController.swift
//  RPS Lesson 20 ItADwS
//
//  Created by Ivan Prybolovetz on 4/3/20.
//  Copyright © 2020 Ivan Prybolovetz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hides the button
        playAgainButton.isHidden = true
        counterLabel.isHidden = true
        
    }
    

    func play(_ sing: Sign) {
        let computerSign = randomSign()
        backgroundButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sing {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
        counterLabel.isHidden = false

        
        let result = sing.getResult(for: computerSign)
        
        var resultWin = 0
        var resultLose = 0
        
        
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            self.view.backgroundColor = UIColor.green
            self.counterLabel.text = "\(resultLose )-\(resultWin + 1)"
        case .lose:
            statusLabel.text = "You lose!"
            self.view.backgroundColor = UIColor.red
            self.counterLabel.text = "\(resultLose + 1)-\(resultWin)"
        case .star:
            reset()
        case .draw:
            statusLabel.text = "It's a draw!"
            self.view.backgroundColor = UIColor.gray
            self.counterLabel.text = "\(resultLose)-\(resultWin)"
        }
    }
    
    //Reset to first screen
    func reset() {
    
        statusLabel.text = "Rock, Paper, Scissors?"
        self.view.backgroundColor = UIColor.white
    
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        playAgainButton.isHidden = false
        counterLabel.isHidden = true
        
        playAgainButton.isHidden = true
    }
    
    // MARK: - IBAction
    @IBAction func rockButtonPressed() {
        play(.rock)
    }
    
    @IBAction func paperButtonPressed() {
        play(.paper)
    }
    
    @IBAction func scissorsButtonPressed() {
        play(.scissors )
    }
    
    @IBAction func resetButtonPressed() {
        reset()
    }
    
    @IBAction func backgroundButtonAction() {
        view.backgroundColor = UIColor.black
        
    }
}

