//
//  ViewController.swift
//  HomeWork_7
//
//  Created by Max on 01.12.2020.
//

import UIKit

class MainViewController: UIViewController {
	private enum DownloadStatus: String {
		case successful
		case failed
	}
	
	@IBOutlet var tableView: UITableView!
	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var errorLabel: UILabel!
	
	let defaultSession = URLSession(configuration: .default)
	var dataTask: URLSessionDataTask?
	var images: [UIImage] = [] {
		didSet {
			self.tableView.reloadData()
		}
	}
	
	lazy var tapRecognizer: UITapGestureRecognizer = {
	  var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
	  return recognizer
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configurateExtensions()
	}
	
	@objc func dismissKeyboard() {
	  searchBar.resignFirstResponder()
	}
	
	func configurateExtensions() {
		tableView.delegate = self
		tableView.dataSource = self
		searchBar.delegate = self
	}
}

extension MainViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return images.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableItem", for: indexPath as IndexPath) as! TableItem
		cell.tableItemImageView.image = images[indexPath.row]
		
		return cell
	}
}

extension MainViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

extension MainViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		dismissKeyboard()
		self.dataTask?.cancel()
		
		guard let searchText = searchBar.text, !searchText.isEmpty else { return }
		guard let url = URL(string: searchText) else { return }
		
		self.dataTask = defaultSession.dataTask(with: url) { data, response, error in
			defer { self.dataTask = nil }
			
			if error != nil {
				DispatchQueue.main.async {
					self.errorLabel.text = DownloadStatus.failed.rawValue
				}
			} else if
				let data = data,
				let response = response as? HTTPURLResponse, response.statusCode == 200 {
				DispatchQueue.main.async {
					self.images.append(UIImage(data: data)!)
					self.errorLabel.text = DownloadStatus.successful.rawValue
				}
			}
		}
		
		self.dataTask?.resume()
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
	  view.addGestureRecognizer(tapRecognizer)
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
	  view.removeGestureRecognizer(tapRecognizer)
	}
}
