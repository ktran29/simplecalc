//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let size = args.count
        let calcOperation = args[size - 1];
        switch calcOperation {
            case "count":
                return size - 1
            case "avg":
                if (size == 1) {
                    return 0
                }
                var avg = 0
                for num in 0...size - 2 {
                    avg += Int(args[num])!
                }
                return avg / (size - 1)
            
            case "fact":
                if size == 1 {
                    return 0
                }
                var factorial = 1;
                var start = Int(args[0])!
                while start > 0 {
                    factorial *= start
                    start -= 1
                }
                return factorial
            
            default:
                let mathOperation = args[1]
                switch mathOperation {
                    case "+":
                        return Int(args[0])! + Int(args[2])!
                    case "-":
                        return Int(args[0])! - Int(args[2])!
                    case "*":
                        return Int(args[0])! * Int(args[2])!
                    case "/":
                        return Int(args[0])! / Int(args[2])!
                    default:
                        var mod = Int(args[0])!
                        while mod >= 0 {
                            mod -= Int(args[2])!
                        }
                        if (mod != 0) {
                            mod += Int(args[2])!
                        }
                        return mod
                }
            
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

