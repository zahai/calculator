//
//  CalculatorBrain.swift
//  calculator
//
//  Created by admin on 8/21/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class CalculatorBrain {
    private var accumulator  = 0.0
    func setoperand(operand :Double){
        accumulator=operand
    }
    var oprations: Dictionary<String,oprtion> = [
        "∏" :oprtion.Constant(M_PI),
        "e" :oprtion.Constant(M_E),
        "√" : oprtion.UnaryOprtion(sqrt),
        "cos" : oprtion.UnaryOprtion(cos),
        "+" : oprtion.BainryOpration({$0 + $1}),
          "÷" : oprtion.BainryOpration({$0 / $1}),
            "×" : oprtion.BainryOpration({$0 * $1}),
              "-" : oprtion.BainryOpration({$0 - $1}),
              "=": oprtion.Equals
    ]
    
    
    enum oprtion{
        case Constant(Double)
        case UnaryOprtion((Double)-> Double)
        case BainryOpration ((Double,Double) -> Double)
        case Equals
    }
    func performoperation(symbol :String){
        if let opration = oprations[symbol]{
            switch opration {
            case .Constant(let value) :
                executePendingopration()
                accumulator = value
                
           
            
            case .UnaryOprtion(let function) :
                executePendingopration()
                accumulator = function(accumulator)
                
            case .BainryOpration(let function):
                executePendingopration()
                pending = PendingBainryOpration(bainryfunction: function, firstoprtion :accumulator)
            
            case .Equals:
               executePendingopration()
                
            }
        }
        
    }
    private func executePendingopration()
    {
        if pending != nil
        {
            accumulator = pending!.bainryfunction(pending!.firstoprtion ,accumulator)
            pending = nil
        }
    }
    private var pending: PendingBainryOpration?
    struct PendingBainryOpration {
        var bainryfunction : (Double ,Double)-> Double
        var firstoprtion :Double
    }
    var result :Double{
        get{
            return accumulator
        }
    }
}
