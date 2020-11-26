//
//  KelvinScale.swift
//  HomeWork_5
//
//  Created by Max on 18.11.2020.
//

class KelvinScale: Scaleble {
	private let KALVIN_CONSTANT = 273.15
	
	func getName() -> String {
		return "kelvin"
	}
	
	func convertToCelsius(_ temperature: Double) -> Double {
		return temperature - KALVIN_CONSTANT
	}
	
	func convertFromCelsius(_ temperature: Double) -> Double {
		return temperature + KALVIN_CONSTANT
	}
}
