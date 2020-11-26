//
//  TemperatureConverter.swift
//  HomeWork_5
//
//  Created by Max on 15.11.2020.
//
import Foundation

class TemperatureConverter {
	private let scales: [Scaleble] 
	
	init(scales: [Scaleble]) {
		self.scales = scales
	}
	
	public func convertTemperature(temperature: Double, from: Scaleble, to: Scaleble) -> Double {
		return formatConvertResult(to.convertFromCelsius(from.convertToCelsius(temperature)))
	}
	
	public func getScales() -> [Scaleble] {
		return self.scales
	}
 }

private extension TemperatureConverter {
	private func formatConvertResult(_ number: Double) -> Double {
		let multiplier = pow(10, Double(2))
		
		return Darwin.round(number * multiplier) / multiplier
	}
}
