//
//  ISubject.swift
//  HomeWork_6
//
//  Created by Max on 01.12.2020.
//

protocol ISubject {
	func subscribe(_ observer: IObserver)
	
	func unsubscribe(_ observer: IObserver)
	
	func notify()
	
	func getState() -> String
}
