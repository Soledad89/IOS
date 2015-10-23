//
//  ViewController.swift
//  Caculator
//
//  Created by 王波 on 15/10/22.
//  Copyright © 2015年 wangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsIntheMiddle : Bool = false
    
    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton){
        
        let digit = sender.currentTitle!
        if userIsIntheMiddle {
            display.text = display.text! + digit
        }else {
            display.text = digit
            userIsIntheMiddle = true
        }
        print("digit = \(digit)")
        
        
    }

    @IBAction func operate(sender: UIButton) {

        if userIsIntheMiddle {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            }else {
                displayValue = 0
            }
            
        }
        
    }
    
    @IBAction func enter() {
        userIsIntheMiddle = false
        if let result =  brain.pushOperand(displayValue) {
            displayValue = result
        }else {
            displayValue = 0
        }

    }
    
    var displayValue : Double  {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsIntheMiddle = false
        }
    }
}

