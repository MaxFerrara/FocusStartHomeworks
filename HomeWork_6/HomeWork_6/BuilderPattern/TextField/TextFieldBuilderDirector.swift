//
//  FieldBuilderDirector.swift
//  HomeWork_6
//
//  Created by Max on 28.11.2020.
//

import UIKit

class TextFieldBuilderDirector {
	private let fieldBuilder: ITextFieldBuilder
	
	init(fieldBuilder: ITextFieldBuilder) {
		self.fieldBuilder = fieldBuilder
	}
	
	func buildUserNameField() -> UITextField {
		self.fieldBuilder.reset()
		self.fieldBuilder.setHint("enter you username")
		self.fieldBuilder.setFontSize(25.0)
		self.fieldBuilder.setTextColor(.black)
		self.fieldBuilder.secureText(false)
		self.fieldBuilder.setKeyBoardType(.default)
		
		return self.fieldBuilder.build()
	}
	
	func buildUserPassword() -> UITextField {
		self.fieldBuilder.reset()
		self.fieldBuilder.setHint("enter you password")
		self.fieldBuilder.setFontSize(25.0)
		self.fieldBuilder.setTextColor(.black)
		self.fieldBuilder.secureText(true)
		self.fieldBuilder.setKeyBoardType(.default)
		
		return self.fieldBuilder.build()
	}
}
