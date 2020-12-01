//
//  ViewBuilder.swift
//  HomeWork_6
//
//  Created by Max on 28.11.2020.
//

import UIKit

class ViewBuilder: IViewBuilder {
	private var loggingFormView = UIView()
	private var topConstraint:NSLayoutYAxisAnchor
	
	init() {
		self.topConstraint = self.loggingFormView.safeAreaLayoutGuide.topAnchor
	}
	
	func addLabel(label: UILabel) -> Self {
		self.loggingFormView.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: self.topConstraint, constant: 20),
			label.leadingAnchor.constraint(equalTo: self.loggingFormView.leadingAnchor, constant: 16),
			label.trailingAnchor.constraint(equalTo: self.loggingFormView.trailingAnchor, constant: -16)
		])
		
		self.topConstraint = label.bottomAnchor
		
		return self
	}
	
	func addTextField(textField: UITextField) -> Self {
		self.loggingFormView.addSubview(textField)
		textField.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: self.topConstraint, constant: 30),
			textField.leadingAnchor.constraint(equalTo: self.loggingFormView.leadingAnchor, constant: 16),
			textField.trailingAnchor.constraint(equalTo: self.loggingFormView.trailingAnchor, constant: 16)
		])
		
		self.topConstraint = textField.topAnchor
		
		return self
	}
	
	func addButton(button: UIButton) -> Self {
		self.loggingFormView.addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			button.topAnchor.constraint(equalTo: self.topConstraint, constant: 110),
			button.centerXAnchor.constraint(equalTo: loggingFormView.centerXAnchor)
		])
		
		return self
	}
	
	func setColor(color: UIColor) -> Self {
		self.loggingFormView.backgroundColor = color
		return self
	}
	
	func build() -> UIView {
		return self.loggingFormView
	}
}
