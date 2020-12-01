//
//  TextFieldBuilder.swift
//  HomeWork_6
//
//  Created by Max on 26.11.2020.
//

import UIKit

class TextFieldBuilder: ITextFieldBuilder {
	private var textField = UITextField()
	
	func reset() {
		self.textField = UITextField()
	}
	
	func setHint(_ hint: String) {
		self.textField.placeholder = hint
	}
	
	func setFontSize(_ fontSize: CGFloat) {
		self.textField.font = UIFont.systemFont(ofSize: fontSize)
	}
	
	func setTextColor(_ textColor: UIColor) {
		self.textField.textColor = textColor
	}
	
	func setBackGroundColor(_ backGroundColor: UIColor) {
		self.textField.backgroundColor = backGroundColor
	}
	
	func secureText(_ isSecure: Bool) {
		self.textField.isSecureTextEntry = isSecure
	}
	
	func setKeyBoardType(_ type: UIKeyboardType) {
		self.textField.keyboardType = type
	}
	
	func build() -> UITextField {
		return self.textField
	}
}
