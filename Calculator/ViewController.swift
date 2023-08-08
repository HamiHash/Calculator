//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            // if number in display is convertable to double "which always is but we are learning 'guard let' here"
            guard let safeDisplayValue = Double(displayLabel.text!) else {fatalError("Cant convert display label to double.")}
            return safeDisplayValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        // methods
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                displayValue *= -1
            }
            if calcMethod == "AC" {
                displayValue = 0
            }
            if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        // if value is not
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                // TO PREVENT USER TO ENTER MULTIPLE DOTS "."
                // check to see if we have a "." in display text or not
                if numValue == "." {
                    // if floored display text number is not equal to the number in display text, return
                    if floor(displayValue) != displayValue {
                        return
                    }
                    // checking to see if the last character is already a "."
                    if let lastCharacter = displayLabel.text!.last {
                        if lastCharacter == "." {
                            return
                        }
                    }
                }
                
                displayLabel.text?.append(numValue)
            }
        }
        
    }
    
}
