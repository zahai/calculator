//
//  ViewController.swift
//  calculator
//
//  Created by admin on 8/15/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   private var userinmadel=false
    @IBOutlet private weak var disply: UILabel!
    
    @IBAction private func tuochdigit(_ sender: UIButton) {
        let digit=sender.currentTitle!
       
        if userinmadel{
            let textdiply=disply!.text!
            disply!.text = textdiply + digit
        }else{
            disply!.text = digit
        }
        userinmadel=true
    }
    
    var displayvalue: Double {
        get{
            return Double(disply.text!)!
        }set
        {
       disply.text = String(newValue)
        }
    }
    private var   brain = CalculatorBrain()
    @IBAction private func opration(_ sender: UIButton) {
        if userinmadel {
            brain.setoperand(operand: displayvalue)
            
                userinmadel = false
             }
       
        
          if let mathmaticalsymbol = sender.currentTitle
          {
      brain.performoperation(symbol: mathmaticalsymbol)
        }
        displayvalue=brain.result
    }
}

