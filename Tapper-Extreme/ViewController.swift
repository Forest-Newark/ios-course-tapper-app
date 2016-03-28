//
//  ViewController.swift
//  Tapper-Extreme
//
//  Created by Forest on 3/27/16.
//  Copyright © 2016 TreeCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variable
    var maxTaps: Int! = 0
    var currentTaps: Int! = 0
    
   //Outlets
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapLabel: UILabel!
    
    //Actions
    
    @IBAction func OnPlayButtonPressed(sender: UIButton!) {

        
        //Validation (! means "not" so.. != means "not equal to"
        if howManyTapsText.text != nil && howManyTapsText.text != "" {
            
        //Hide and Unhide apporipriate labels
            logoImage.hidden = true
            howManyTapsText.hidden = true
            playButton.hidden = true
            
            tapButton.hidden = false
            tapLabel.hidden = false
            
            
            //Set "maxTaps" to an Int value equal to the text field
            maxTaps = Int(howManyTapsText.text!)!
            
            //Set "currentTaps" to 0 as starting point for game
            currentTaps = 0
            
            
            //Set tap label equal to current taps
            updateTapsLabel()
        }
    }
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        
        currentTaps = currentTaps + 1
        updateTapsLabel()
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateTapsLabel() {
        tapLabel.text = "\(currentTaps) Taps"
        
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsText.text = ""
        logoImage.hidden = false
        howManyTapsText.hidden = false
        playButton.hidden = false
        
        tapButton.hidden = true
        tapLabel.hidden = true
    }
    
}

