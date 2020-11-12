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
	
	public func append(_ item: Item) {
		self.queue.async(flags: .barrier) {
			self.items.append(item)
		}
	}
	
	public func remove(index: Int) {
		self.queue.async(flags: .barrier) {
			self.items.remove(at: index)
		}
	}
	
	subscript(index: Int) -> Item? {
		get {
			self.queue.sync {
				return self.items[index]
			}
		}
	}
	
	var isEmpty: Bool {
		self.queue.sync {
			return self.items.isEmpty
		}
	}
	
	var count: Int {
		self.queue.sync {
			return self.items.count
		}
	}
	
	var toString: String {
		self.queue.sync {
			return self.items.description
		}
	}
}

extension ThreadSafeArray where Item: Equatable {
	func contains(_ item: Item) -> Bool {
		self.queue.sync {
			return self.items.contains(item)
		}
	}
}


