//
//  CarApplication.swift
//  FirstHomeWork
//
//  Created by Max on 22.10.2020.
//

import Foundation
class CarApplication {
    private var cars: [Car] = []
    private let consoleHelper: ConsoleHelper
    
    init(consoleHelper: ConsoleHelper) {
        self.consoleHelper = consoleHelper
    }
    
    public func start() {
        while true {
            self.printCommandsHint()
            
            switch readLine() {
            case "1":
                self.addCar()
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
    func addCar() {
        let bodyType = self.getBodyType()
        
        print("enter manufacturer:")
        let manufacturer = self.consoleHelper.getUserString()
        
        print("enter model:")
        let model = self.consoleHelper.getUserString()
        
        print("enter year of issue:")
        print("(if you want skip this field press - enter)")
        let yearOfIssue = self.consoleHelper.getUserOptionalInt()
        
        print("enter car number:")
        print("(if you want skip this field press - enter)")
        let carNumber = readLine()
        
        cars.append(Car(bodyType: bodyType,
                        manufacturer: manufacturer,
                        model: model,
                        yearOfIssue: yearOfIssue,
                        carNumber: carNumber))
    }
    
    func printCars() {
        if cars.isEmpty {
            print("carlist is empty")
            return
        }
        
        print("all cars:")
        for (index, car) in self.cars.enumerated() {
            print("car number: \(index + 1)")
            print("-----------------")
            print(car)
            print()
        }
    }
    
    func sortCarsByBodyType() {
        if cars.isEmpty {
            print("carlist is empty")
            return
        }
        
        let bodyType = self.getBodyType()
        
        let filtredCars = self.cars.filter {$0.getBodyType() == bodyType}
        
        if filtredCars.isEmpty {
            print("no one car with this body-type")
        } else {
            print("cars with body-type: \(bodyType.name)")
            print()
            
            for car in filtredCars {
                print(car)
                print()
            }
        }
    }
    
    func printCommandsHint() {
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
        let bodyPosition = self.consoleHelper.getUserInt()
        
        if let body = Body(rawValue: bodyPosition) {
            return body
        } else {
            print("invalid value, try one more")
            return self.getBodyType()
        }
    }
}
