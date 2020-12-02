//
//  IButtonBuilder.swift
//  HomeWork_6
//
//  Created by Max on 26.11.2020.
//

import UIKit

protocol IButtonBuilder {
	func reset()
	func setText(_ text: String)
	func setTextColor(_ color: UIColor)
	func setTextSize(_ size: CGFloat)
	func setBackGroundColor(_ color: UIColor)
	func setCornerRadius(_ radius: CGFloat)
	func setAction(_ target: Any?, action: Selector, for event: UIControl.Event)
	func build() -> UIButton
}
