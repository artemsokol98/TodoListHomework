//
//  TaskRepository.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 15.02.2023.
//

import Foundation

protocol IRepository {
	func getAllTasks() -> [Task]
}

class TaskRepository: IRepository {
	
	/// Get tasks from stub in repository
	func getAllTasks() -> [Task] {
		[
			RegularTask(title: "Buy Milk", completed: true),
			ImportantTask(priority: .low, title: "Food", completed: true),
			RegularTask(title: "Buy Car", completed: false),
			ImportantTask(priority: .medium, title: "Water", completed: false),
			RegularTask(title: "Meet with Friends", completed: true),
			ImportantTask(priority: .high, title: "Application", completed: true),
			RegularTask(title: "Watch Star Wars", completed: false),
			RegularTask(title: "Feed cat", completed: true),
			RegularTask(title: "Do homework", completed: false)
		]
	}
}
