//
//  CarApplication.swift
//  FirstHomeWork
//
//  Created by Max on 22.10.2020.
//

import Foundation
class CarApplication {
    private var carManager: CarManager
    
    init(carManager: CarManager) {
        self.carManager = carManager
    }
    
    public func start() -> Void {
        while true {
            self.printCommandsHint()
            
            let number = readLine()
            
            switch number {
            case "1":
                self.createCar()
            case "2":
                self.printCars()
            case "3":
                self.sortCarsByBodyType()
            case "0":
                exit(0)
            default:
                break
            }
        }
    }
}

private extension CarApplication {
    func createCar() -> Void {
        let bodyType = self.getBodyType()
        
        print("enter manufacturer:")
        let manufacturer = self.getString()
        
        print("enter model:")
        let model = self.getString()
        
        print("enter year of issue:")
        let yearOfIssue = self.getOptionalInt()
        
        print("enter car number:")
        print("if you want skip this field press - enter")
        let carNumber = readLine()
        
        carManager.addCar(car: Car(bodyType: bodyType, manufacturer: manufacturer, model: model, yearOfIssue: yearOfIssue, carNumber: carNumber))
    }
    
    func printCars() -> Void {
        print("all cars:")
        carManager.printAllcars()
    }
    
    func sortCarsByBodyType() -> Void {
        let bodyType = self.getBodyType()
        
        carManager.sortByBodyType(bodyType: bodyType)
    }
    
    func printCommandsHint() -> Void {
        print("--------------------")
        print("Commands hint:")
        print("1 - add car")
        print("2 - print all cars")
        print("3 - filter cars by body-type")
        print("0 - exit")
        print("--------------------")
    }
    
    func getBodyType() -> Body {
        print("choose car body-type")
        
        for body in Body.allCases {
            print("\(body.rawValue) - \(body)")
        }
        
        print("enter you value: ")
        let bodyPosition = self.getInt()
        
        if let body = Body(rawValue: bodyPosition) {
            return body
        } else {
            print("invalid value, try one more")
            return self.getBodyType()
        }
    }
    
    func getString() -> String {
        var inputString = ""
        
        while inputString.isEmpty {
            if let string = readLine(), string.isEmpty == false {
                inputString = string
            } else {
                print("ivalid value, try one more")
            }
        }
        
        return inputString
    }
    
    func getInt() -> Int {
        var inputInt: Int?
        
        while inputInt == nil {
            let string = self.getString()
            
            if let int = Int(string) {
                inputInt = int
            } else {
                print("ivalid value, try one more")
            }
        }
        
        return inputInt ?? 0
    }
    
    func getOptionalInt() -> Int? {
        var inputValue: Int?
        
        while true {
            let string = readLine()!
            
            if string == "" {
                return nil
            } else if let number = Int(string), string != "" {
                inputValue = number
                break
            } else {
                print("invalid value, try one more")
            }
        }
        
        return inputValue
    }
}
