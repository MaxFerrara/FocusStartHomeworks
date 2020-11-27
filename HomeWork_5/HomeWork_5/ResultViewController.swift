//
//  ResultViewController.swift
//  HomeWork_5
//
//  Created by Max on 18.11.2020.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {
	@IBOutlet weak var resultLabel: UILabel!
	
	private var convertResult: String = ""
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		resultLabel.text = convertResult
    }
	
	public func setConvertResult(_ newResult: String) {
		convertResult = newResult
	}
}
