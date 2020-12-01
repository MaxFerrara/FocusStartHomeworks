//
//  TitleBuilder.swift
//  HomeWork_6
//
//  Created by Max on 26.11.2020.
//

import UIKit

class LabelBuilder: ILabelBuilder {
	private var label = UILabel()
	
	func reset() {
		self.label = UILabel()
	}
	
	func setText(_ title: String) {
		self.label.text = title
	}
	
	func setFontSize(_ size: CGFloat) {
		self.label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: size)
	}
	
	func setTextColor(_ color: UIColor) {
		self.label.textColor = color
	}
	
	func setLinesQuantity(_ quantity: Int) {
		self.label.numberOfLines = quantity
	}
	
	func setTextAlignment() {
		self.label.textAlignment = .center
	}
	
	func build() -> UILabel {
		return self.label
	}
}
