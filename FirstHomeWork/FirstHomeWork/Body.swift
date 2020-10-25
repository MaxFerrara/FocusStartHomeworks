//
//  BodyType.swift
//  FirstHomeWork
//
//  Created by Max on 20.10.2020.
//

import Foundation
enum Body: Int, CaseIterable {
    case sedan = 1
    case coupe
    case suv
    
    var name: String {
        switch self {
        case .sedan: return "sedan"
        case .coupe: return "coupe"
        case .suv: return "suv"
        }
    }
}
