//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Justin Hughes on 12/7/15.
//  Copyright © 2015 Justin Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer:Int = 1 //1 = x's and 2 = o's
    
    var gameState : [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCominations = [[0, 1, 2], [3 , 4, 5], [6, 7, 8], [0, 3, 6], [1 , 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive:Bool = true
    
    var crossesWins:Int = 0
    
    var noughtWins:Int = 0
    

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var resultsLabel: UILabel!

    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var winsLabel: UILabel!
    
    @IBAction func playAgainButton(sender: AnyObject) {
        
        //reset game
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        gameActive = true
        
        resultsLabel.hidden = true
        
        resultsLabel.center = CGPointMake(resultsLabel.center.x - 500, resultsLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        
        //loop through all the buttons to reset
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            
            
            buttonToClear = view.viewWithTag(i) as! UIButton//get tag then convert view to a button
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        //get image tag
        
        if gameState[sender.tag] == 0 && gameActive == true{
            
            print(activePlayer)
            
            gameState[sender.tag] = activePlayer
        
            //sender gives the name of the object pressed
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                
                activePlayer = 2
                
            }
            
            else {
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                
                activePlayer = 1
                
            }
            
            for combination in winningCominations {
                
                //checks for a winning combination
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    gameActive = false
                    if gameState[combination[0]] == 1{
                        
                        resultsLabel.text = " Crosses have won!"
                        
                        ++crossesWins
                        
                        winsLabel.text = "Crosses: \(crossesWins)  Noughts: \(noughtWins)"
                    }
                    
                    else{
                        resultsLabel.text = "Noughts have won!"
                        ++noughtWins
                        
                        winsLabel.text = "Crosses: \(crossesWins)  Noughts: \(noughtWins)"
                    }
                    
                    endGame()
                }
                
            
            }
            
            if gameActive == true{
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                    }
                }
                
                if gameActive == false {
                    
                    resultsLabel.text = "It's a draw!"
                    endGame()
                }
            }
        }
        
    }
    
    func endGame() {
        
        resultsLabel.hidden = false
        playAgainButton.hidden = false
        
        UIView.animateWithDuration(0.5 , animations: { () -> Void in
            self.resultsLabel.center = CGPointMake(self.resultsLabel.center.x + 500, self.resultsLabel.center.y)
        })
        
        
        UIView.animateWithDuration(0.5 , animations: { () -> Void in
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winsLabel.text = "Crosses: \(crossesWins)  Noughts: \(noughtWins)"
        
        resultsLabel.hidden = true
        
        resultsLabel.center = CGPointMake(resultsLabel.center.x - 500, resultsLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

