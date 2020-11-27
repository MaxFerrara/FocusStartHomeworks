//
//  ThirdViewController.swift
//  HomeWork_3
//
//  Created by Max on 07.11.2020.
//

import UIKit

class ThirdViewController: UIViewController {
	@IBOutlet weak var enterButton: UIButton!
	@IBOutlet weak var passwordInputArea: UITextField!
	@IBOutlet weak var loginInputArea: UITextField!
	@IBOutlet weak var topLabelConstraint: NSLayoutConstraint!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.roundButtonCorners()
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
		
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

			view.addGestureRecognizer(tap)
    }
	
	@objc func keyboardWillShow(_ notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				self.view.frame.origin.y -= keyboardSize.height
				self.topLabelConstraint.constant += keyboardSize.height
			}
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
		self.topLabelConstraint.constant = 35
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	func roundButtonCorners() {
		enterButton.layer.cornerRadius = 8
		enterButton.layer.masksToBounds = true
	}
}
