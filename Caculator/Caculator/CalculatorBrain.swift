//
//  CalculatorBrain.swift
//  Caculator
//
//  Created by 王波 on 15/10/22.
//  Copyright © 2015年 wangbo. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private enum Op{
        case Operand(Double)
        case UnaryOperation(String, Double->Double)
        case BinaryOperation(String, (Double, Double)->Double)
        
        var discription : String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symble, _):
                    return symble
                case .BinaryOperation(let symble, _):
                    return symble
                }
            }
        }
    }
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()

    init() {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷"){$1 / $0}
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−"){$1 - $0}
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops : [Op]) -> (result : Double?, remainingOps : [Op]) {
        if !ops.isEmpty {
            var reminingOps = ops
            let op = reminingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, reminingOps)
            case .UnaryOperation(_, let operation):
                let operationEvaluation = evaluate(reminingOps)
                if let operand = operationEvaluation.result {
                    return (operation(operand), operationEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(reminingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand : Double) ->Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symble : String) ->Double? {
        if let operation = knownOps[symble] {
            opStack.append(operation)
        }
        return evaluate()
    }
}
