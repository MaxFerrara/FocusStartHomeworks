//
//  Car.swift
//  FirstHomeWork
//
//  Created by Max on 20.10.2020.
//

import Foundation
struct Car: CustomStringConvertible {
    private let bodyType: Body
    private let manufacturer: String
    private let model: String
    
    private let yearOfIssue: Int?
    private let carNumber: String?
    
    init(bodyType: Body, manufacturer: String, model: String,
         yearOfIssue: Int? = nil, carNumber: String? = nil) {
        self.bodyType = bodyType
        self.manufacturer = manufacturer
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.carNumber = carNumber
    }
    
    public var description: String {
        if self.carNumber == "" {
            return """
            manufacturer: \(self.manufacturer)
            model: \(self.model)
            bodyType: \(self.bodyType.name)
            yearOfIssue: \(self.yearOfIssue?.description ?? "-")
            """
        }
        
        return """
            manufacturer: \(self.manufacturer)
            model: \(self.model)
            bodyType: \(self.bodyType.name)
            yearOfIssue: \(self.yearOfIssue?.description ?? "-")
            carNumber: \(self.carNumber ?? "-")
            """
    }
    
    func getBodyType() -> Body {
        return self.bodyType
    }
}
