//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Gabriel Castillo Serafim on 18/10/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (number1: Double, operation: String)?
    
    mutating func setNumber(to number: Double) {
        self.number = number
    }
    
    mutating func performCalculation(calculationPressed: String) -> Double? {
        guard let n = number else {return nil}
        
        switch calculationPressed {
        case "+/-":
            return n * -1
            
        case "AC":
            return 0
            
        case "%":
            return n/100
            
        case "=":
            return performTwoNumberCalculation(n2: n)
            
        default:
            intermediateCalculation = (number1: n, operation: calculationPressed)
            return n
        }
        
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        guard let n1 = intermediateCalculation?.number1, let operation = intermediateCalculation?.operation else {return nil}
        
        switch operation {
        case "+":
            return n1 + n2
        
        case "-":
            return n1 - n2
            
        case "x":
            return n1 * n2
            
        default:
            return n1 / n2
             
        }
        
        
    }
    
}
