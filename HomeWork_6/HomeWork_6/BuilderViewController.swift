//
//  ViewController.swift
//  HomeWork_6
//
//  Created by Max on 24.11.2020.
//

import UIKit

class BuilderViewController: UIViewController {
	private var viewBuilder = ViewBuilder()
	private let customView = BuilderDemonstrationView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func loadView() {
		view = customView.createView(viewBuilder)
		self.title = "first"
		self.dismissKey()
	}
}

extension UIViewController {
	func dismissKey() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false;
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}


