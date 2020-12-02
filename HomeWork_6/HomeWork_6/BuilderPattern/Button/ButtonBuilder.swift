//
//  ButtonBuilder.swift
//  HomeWork_6
//
//  Created by Max on 28.11.2020.
//

import UIKit

class ButtonBuilder: IButtonBuilder {
	private var button = UIButton()
	
	func reset() {
		self.button = UIButton()
	}
	
	func setText(_ text: String) {
		self.button.setTitle(text, for: .normal)
	}
	
	func setTextColor(_ color: UIColor) {
		self.button.setTitleColor(color, for: .normal)
	}
	
	func setTextSize(_ size: CGFloat) {
		self.button.titleLabel?.font = UIFont.systemFont(ofSize: size)
	}
	
	func setBackGroundColor(_ color: UIColor) {
		self.button.backgroundColor = color
	}
	
	func setCornerRadius(_ radius: CGFloat) {
		self.button.layer.cornerRadius = radius
	}
	
	func setAction(_ target: Any?, action: Selector, for event: UIControl.Event) {
		self.button.addTarget(target, action: action, for: event)
	}
	
	func build() -> UIButton {
		return self.button
	}
}
