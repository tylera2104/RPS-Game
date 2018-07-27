//
//  ViewController.swift
//  RPS
//
//  Created by Tyler Albrecht on 7/26/18.
//  Copyright © 2018 Tyler Albrecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var playerRock: UIButton!
    @IBOutlet weak var playerPaper: UIButton!
    @IBOutlet weak var playerScissors: UIButton!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(.start)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playerRockPlayed(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func playerPaperPlayed(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func playerScissorsPlayed(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func playAgainPressed(_ sender: UIButton) {
        updateUI(.start)
    }
    
    func updateUI(_ state: GameState){
        if state == .start{
            appSign.text = "🤖"
            gameStatus.text = "Rock, Paper, or Scissors?"
            playAgain.isHidden = true
            playerRock.isEnabled = true
            playerPaper.isEnabled = true
            playerScissors.isEnabled = true
            playerRock.isHidden = false
            playerScissors.isHidden = false
            playerPaper.isHidden = false
            self.view.backgroundColor = UIColor.blue
          
        } else if state == .win {
            gameStatus.text = "You win!"
            self.view.backgroundColor = UIColor.green
        } else if state == .lose {
            gameStatus.text = "You lost"
            self.view.backgroundColor = UIColor.red
        } else {
            gameStatus.text = "Draw"
            self.view.backgroundColor = UIColor.white
        }
        
    }
    
    func play( _ playerSign: Sign){
        let otherSign = randomSign()
        switch otherSign{
            case .scissors: appSign.text = "✌️" // IMPROVE
            case .rock: appSign.text = "👊"
            case .paper: appSign.text = "🖐"
        }
        let gameState = compareSigns(other: otherSign, player: playerSign)
        updateUI(gameState)
        playerRock.isEnabled = false
        playerPaper.isEnabled = false
        playerScissors.isEnabled = false
        
        if playerSign == .paper{
            playerRock.isHidden = true
            playerScissors.isHidden = true
        } else if playerSign == .rock{
            playerScissors.isHidden = true
            playerPaper.isHidden = true
        } else {
            playerPaper.isHidden = true
            playerRock.isHidden = true
        }
        playAgain.isHidden = false
        
        
    }
    
    
    


}

