//
//  ViewController.swift
//  HomeWork_5
//
//  Created by Max on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var convertFromControl: UISegmentedControl!
	@IBOutlet weak var convertToControl: UISegmentedControl!
	@IBOutlet weak var inputTextField: UITextField!
	
	let scales: Array<Scaleble> = [CelsiusScale(), FahrenheitScale(), KelvinScale()]
	lazy var converter = TemperatureConverter(scales: scales)
	
	var fromSegmentTextxValue: String = ""
	var toSegmentTextValue: String = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		dismissKey()
	}
	
	@IBAction func onConvertButtonClick(_ sender: Any) {
		let enteredTemperatureValue = inputTextField.text
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		guard let secondViewController = storyboard.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return }
		
		fromSegmentTextxValue = convertFromControl.titleForSegment(at:convertFromControl.selectedSegmentIndex)!
		toSegmentTextValue = convertToControl.titleForSegment(at:convertToControl.selectedSegmentIndex)!
		
		if Double(enteredTemperatureValue ?? "") == nil {
			secondViewController.setConvertResult("you enter not a number or textfield is empty, try one more")
		} else {
			let res = Double(enteredTemperatureValue!)
			let convertResult: Double = self.converter.convertTemperature(temperature: res!, from: getInitialScale(), to: getEndScale())
			secondViewController.setConvertResult(String(convertResult))
		}
		
		show(secondViewController, sender: nil)
	}
	
	public func getInitialScale() -> Scaleble {
		return self.getScale(temperature: fromSegmentTextxValue)
	}
	
	public func getEndScale() -> Scaleble {
		return self.getScale(temperature: toSegmentTextValue)
	}
	
	private func getScale(temperature: String) -> Scaleble {
		var scaleToFild: Scaleble?
		
		for scale in scales {
			if scale.getName() == temperature {
				scaleToFild = scale
			}
		}
		
		return scaleToFild!
	}
}

extension UIViewController {
	func dismissKey() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false;
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}

