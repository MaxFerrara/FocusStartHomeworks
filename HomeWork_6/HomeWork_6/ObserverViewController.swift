//
//  ObserverViewController.swift
//  HomeWork_6
//
//  Created by Max on 30.11.2020.
//

import UIKit

class ObserverViewController: UIViewController {
	let customView = ObserverDemonstrationView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view = customView
		self.title = "second"
    }
}
