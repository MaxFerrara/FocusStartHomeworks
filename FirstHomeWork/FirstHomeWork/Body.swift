//
//  BodyType.swift
//  FirstHomeWork
//
//  Created by Max on 20.10.2020.
//

enum Body: Int, CaseIterable {
    case sedan = 1
    case coupe
    case suv
    
    var name: String {
        return String(describing: self)
    }
}
