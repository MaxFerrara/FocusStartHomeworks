//
//  FirstViewController.swift
//  HomeWork_3
//
//  Created by Max on 07.11.2020.
//

import UIKit

class FirstViewController: UIViewController {
	@IBOutlet weak var roundButton: UIButton!
	
	@IBOutlet weak var rectangleButton: UIButton!

	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.changeButtonsDimensions()
    }
	
	func changeButtonsDimensions() {
		roundButton.layer.cornerRadius = 0.5 * roundButton.frame.width
		roundButton.layer.masksToBounds = true
		
		rectangleButton.layer.cornerRadius = 8
		rectangleButton.layer.masksToBounds = true
	}
}
