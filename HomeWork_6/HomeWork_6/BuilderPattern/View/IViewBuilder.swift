//
//  IViewBuilder.swift
//  HomeWork_6
//
//  Created by Max on 26.11.2020.
//

import UIKit

protocol IViewBuilder {
	func addLabel(label: UILabel) -> Self
	func addTextField(textField: UITextField) -> Self
	func addButton(button: UIButton) -> Self
	func setColor(color: UIColor) -> Self
	func build() -> UIView
}
