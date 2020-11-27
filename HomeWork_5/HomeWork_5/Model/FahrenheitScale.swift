//
//  FahrenheitScale.swift
//  HomeWork_5
//
//  Created by Max on 15.11.2020.
//

class FahrenheitScale: Scaleble {
	private let CELSIUS_FAHRENHEIT_COEFFICIENT = 1.8
	private let FAHRENHEIT_CONSTANT = 32.0
	
	func getName() -> String {
		return "fahrenheit"
	}
	
	func convertToCelsius(_ temperature: Double) -> Double {
		return (temperature - FAHRENHEIT_CONSTANT) / CELSIUS_FAHRENHEIT_COEFFICIENT
	}
	
	func convertFromCelsius(_ temperature: Double) -> Double {
		return temperature * CELSIUS_FAHRENHEIT_COEFFICIENT + FAHRENHEIT_CONSTANT
	}
}
