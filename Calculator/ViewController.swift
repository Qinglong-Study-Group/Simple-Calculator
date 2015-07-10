//
//  ViewController.swift
//  Calculator
//
//  Created by Hao Jin on 5/19/15.
//  Copyright (c) 2015 Hao Jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    
    var user = false
    
    var brain = CalculatorBrain()
    
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        if user {
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            user = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if user{
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            }else {
                displayValue = 0
            }
            
        }
    }
    

    @IBAction func enter() {
        user = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            user = false
        }
    }
}

