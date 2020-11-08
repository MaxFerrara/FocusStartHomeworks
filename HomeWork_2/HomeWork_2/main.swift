//
//  main.swift
//  HomeWork_2
//
//  Created by Max on 01.11.2020.
//

import Foundation

let group = DispatchGroup()
let queue = DispatchQueue.global(qos: .userInteractive)

var threadSafeArray = ThreadSafeArray<Int>()

group.enter()
queue.async {
	for number in 0...1000 {
		threadSafeArray.append(number)
	}
	
	group.leave()
}

group.enter()
queue.async {
	for number in 0...1000 {
		threadSafeArray.append(number)
	}
	
	group.leave()
}

group.wait()

print("Result:")
print(threadSafeArray.count)
