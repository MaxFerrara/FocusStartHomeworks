//
//  BuilderDemonstrationView.swift
//  HomeWork_6
//
//  Created by Max on 29.11.2020.
//

import Foundation
import UIKit

class BuilderDemonstrationView {
	private var labelBuilder = LabelBuilder()
	private var buttonBuilder = ButtonBuilder()
	
	func createLabel(builder: LabelBuilder) -> UILabel {
		builder.reset()
		builder.setText("Login form")
		builder.setFontSize(35)
		builder.setTextColor(.black)
		builder.setLinesQuantity(0)
		builder.setTextAlignment()
		
		return builder.build()
	}
	
	func createButton(builder: ButtonBuilder) -> UIButton {
		builder.reset()
		builder.setText("submit")
		builder.setTextColor(.black)
		builder.setTextSize(25)
		builder.setBackGroundColor(.red)
		builder.setCornerRadius(10)
		builder.setAction(self, action: #selector(pressButton), for: .touchUpInside)
		
		return builder.build()
	}
	
	public func createView(_ builder: ViewBuilder) -> UIView {
		let title = createLabel(builder: labelBuilder)
		
		let textFieldBuilder = TextFieldBuilder()
		let textFieldBuilderDirector = TextFieldBuilderDirector(fieldBuilder: textFieldBuilder)
		let userNameTextField = textFieldBuilderDirector.buildUserNameField()
		let userPasswordTextField = textFieldBuilderDirector.buildUserPassword()
		
		let submitButton = createButton(builder: buttonBuilder)
		
		return builder.setColor(color: .white)
			.addLabel(label: title)
			.addTextField(textField: userNameTextField)
			.addTextField(textField: userPasswordTextField)
			.addButton(button: submitButton)
			.build()
	}
	
	@objc func pressButton() {}
}
