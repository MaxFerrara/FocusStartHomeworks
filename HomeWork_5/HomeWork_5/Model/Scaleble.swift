//
//  Scaleble.swift
//  HomeWork_5
//
//  Created by Max on 15.11.2020.
//

protocol Scaleble {
	func getName() -> String
	func convertToCelsius(_ temperature: Double) -> Double
	func convertFromCelsius(_ temperature: Double) -> Double
}
