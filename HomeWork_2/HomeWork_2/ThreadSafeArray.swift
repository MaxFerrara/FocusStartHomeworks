//
//  ThreadSafeArray.swift
//  HomeWork_2
//
//  Created by Max on 01.11.2020.
//

import Foundation

class ThreadSafeArray<Item> {
	private var items: [Item] = []
	private let queue = DispatchQueue(label: "name.MaxFerrara.HomeWork_2", attributes: .concurrent)
	
	init() {
		items = []
	}
	
	public func append(_ item: Item) {
		queue.async(flags: .barrier) {
			self.items.append(item)
		}
	}
	
	public func remove(index: Int) {
		queue.async(flags: .barrier) {
			self.items.remove(at: index)
		}
	}
	
	subscript(index: Int) -> Item? {
		get {
			queue.sync {
				return self.items[index]
			}
		}
	}
	
	var isEmpty: Bool {
		queue.sync(flags: .barrier) {
			return items.isEmpty
		}
	}
	
	var count: Int {
		queue.sync {
			return self.items.count
		}
	}
	
	var toString: String {
		queue.sync {
			return self.items.description
		}
	}
}

extension ThreadSafeArray where Item: Equatable {
	func contains(_ item: Item) -> Bool {
		queue.sync {
			return self.items.contains(item)
		}
	}
}


