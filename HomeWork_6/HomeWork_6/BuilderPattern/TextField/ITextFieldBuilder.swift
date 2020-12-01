//
//  ITextFieldBuilder.swift
//  HomeWork_6
//
//  Created by Max on 26.11.2020.
//

import UIKit

protocol ITextFieldBuilder {
	func reset()
	func setHint(_ hint: String)
	func setFontSize(_ fontSize: CGFloat)
	func setTextColor(_ textColor: UIColor)
	func setBackGroundColor(_ color: UIColor)
	func secureText(_ isSecure: Bool)
	func setKeyBoardType(_ type: UIKeyboardType)
	func build()-> UITextField
}
