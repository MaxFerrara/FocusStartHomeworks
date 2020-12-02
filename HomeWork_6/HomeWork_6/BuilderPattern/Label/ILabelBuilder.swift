//
//  ILabelBuilder.swift
//  HomeWork_6
//
//  Created by Max on 26.11.2020.
//

import UIKit

protocol ILabelBuilder {
	func reset()
	func setText(_ title: String)
	func setFontSize(_ size: CGFloat)
	func setTextColor(_ color: UIColor)
	func setLinesQuantity(_ quantity: Int)
	func setTextAlignment()
	func build() -> UILabel
}
