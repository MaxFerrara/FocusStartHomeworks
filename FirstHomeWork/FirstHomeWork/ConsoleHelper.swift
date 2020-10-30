//
//  ConsoleHelper.swift
//  FirstHomeWork
//
//  Created by Max on 30.10.2020.
//

class ConsoleHelper {
    func getUserString() -> String {
        var userString = ""
        
        while userString.isEmpty {
            if let inputValue = readLine(), inputValue.isEmpty == false {
                userString = inputValue
            } else {
                print("ivalid value, try one more")
            }
        }
        
        return userString
    }
    
    func getUserInt() -> Int {
        var userInt: Int?
        
        while userInt == nil {
            let inputValue = self.getUserString()
            
            if let int = Int(inputValue) {
                userInt = int
            } else {
                print("ivalid value, try one more")
            }
        }
        
        return userInt ?? 0
    }
    
    func getUserOptionalInt() -> Int? {
        var userOptionalInt: Int?
        
        while true {
            let inputValue = readLine()!
            
            if inputValue.isEmpty {
                return nil
            } else if let number = Int(inputValue), !inputValue.isEmpty {
                userOptionalInt = number
                break
            } else {
                print("invalid value, try one more")
            }
        }
        
        return userOptionalInt
    }
}
