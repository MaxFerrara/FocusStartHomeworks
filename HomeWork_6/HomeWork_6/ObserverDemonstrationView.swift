//
//  ObserverDemonstrationView.swift
//  HomeWork_6
//
//  Created by Max on 30.11.2020.
//

import UIKit

class ObserverDemonstrationView: UIView {
	private lazy var observers = [IObserver]()
	
	private enum State: String {
		case on = "on"
		case off = "off"
	}
	
	private enum Metrics {
		static let numberOfLines = 1
		static let switchTopConstraint:CGFloat = 150
		static let itemsTopConstraint: CGFloat = 80
	}
	
	private lazy var slider: UISwitch = {
		let uiSwitch = UISwitch()
		uiSwitch.translatesAutoresizingMaskIntoConstraints = false
		
		return uiSwitch
	}()
	
	private lazy var notifyButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("notify", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		button.titleLabel?.font = UIFont(name: "AppleSymbols", size: 35)
		button.layer.cornerRadius = 8
		button.addTarget(self, action: #selector(onNotifyButtonClick(_:)), for: .touchUpInside)
		
		return button
	}()
	
	private lazy var firstLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		
		return label
	}()
	
	private lazy var secondLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		self.createCustomView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func onNotifyButtonClick(_ sender: UIButton) {
		self.firstLabel.update(subject: self)
		self.secondLabel.update(subject: self)
	}
}

private extension ObserverDemonstrationView {
	func createCustomView() {
		self.backgroundColor = .cyan
		self.addSubview(slider)
		self.addSubview(notifyButton)
		self.addSubview(firstLabel)
		self.addSubview(secondLabel)
		
		NSLayoutConstraint.activate([
			self.slider.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.switchTopConstraint),
			self.slider.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.notifyButton.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: Metrics.itemsTopConstraint),
			self.notifyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.firstLabel.topAnchor.constraint(equalTo: self.notifyButton.bottomAnchor, constant: Metrics.itemsTopConstraint),
			self.firstLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.secondLabel.topAnchor.constraint(equalTo: self.firstLabel.topAnchor, constant: Metrics.itemsTopConstraint),
			self.secondLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
		])
		
		self.subscribe(firstLabel)
		self.subscribe(secondLabel)
	}
}

extension ObserverDemonstrationView: ISubject {
	func subscribe(_ observer: IObserver) {
		self.observers.append(observer)
	}
	
	func unsubscribe(_ observer: IObserver) {
		if let index = observers.firstIndex(where: { $0 === observer }) {
			self.observers.remove(at: index)
		}
	}
	
	func notify() {
		for observer in observers {
			observer.update(subject: self as ISubject)
		}
	}
	
	func getState() -> String {
		if slider.isOn {
			return State.on.rawValue
		}
		
		return State.off.rawValue
	}
}

extension UILabel: IObserver {
	func update(subject: ISubject) {
		self.text = subject.getState()
	}
}

