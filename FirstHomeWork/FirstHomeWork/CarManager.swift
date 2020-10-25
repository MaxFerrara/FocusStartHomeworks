//
//  CarManager.swift
//  FirstHomeWork
//
//  Created by Max on 22.10.2020.
//

import Foundation
class CarManager {
    private var cars: [Car] = []
    
    func addCar(car: Car) -> Void {
        cars.append(car)
    }
    
    func printAllcars() -> Void {
        if(cars.isEmpty) {
            print("carlist is empty")
        } else {
            for (index, car) in self.cars.enumerated() {
                print("car number: \(index + 1)")
                print("-----------------")
                print(car)
                print()
            }
        }
    }
    
    func sortByBodyType(bodyType: Body) -> Void {
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
}
