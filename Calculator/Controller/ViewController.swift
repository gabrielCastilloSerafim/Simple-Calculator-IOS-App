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
    
    private var firstType = true
    
    private var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculate = CalculationLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        firstType = true
        
        let calculationPressed = sender.currentTitle!
        
        calculate.setNumber(to: displayValue)
        
        guard let result = calculate.performCalculation(calculationPressed: calculationPressed) else {
            return
        }
        displayValue = result
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if firstType == true {
            displayLabel.text = ""
            displayLabel.text?.append(sender.currentTitle!)
            firstType = false
        } else {
            if sender.currentTitle == "." {
                if displayLabel.text!.contains(".") {
                    return
                }
            }
            displayLabel.text?.append(sender.currentTitle!)
        }
        
        
    
    }

}

