//
//  OrderedTaskManager.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 18.02.2023.
//

import Foundation

final class OrderedTaskManager: ITaskManager {
	let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Get all sorted tasks
	public func allTasks() -> [Task] {
		sorted(tasks: taskManager.allTasks())
	}
	
	/// Get all sorted only completed tasks
	public func completedTasks() -> [Task] {
		sorted(tasks: taskManager.completedTasks())
	}
	
	/// Get all sorted only uncompleted tasks
	public func uncompletedTasks() -> [Task] {
		sorted(tasks: taskManager.uncompletedTasks())
	}
	
	/// This function allows add one or more tasks as array
	public func addTasks(tasks: [Task]) {
		taskManager.addTasks(tasks: tasks)
	}
	
	private func sorted(tasks: [Task]) -> [Task] {
		tasks.sorted {
			if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
				return task0.priority.rawValue > task1.priority.rawValue
			}
			
			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}
		
			if  $0 is RegularTask, $1 is ImportantTask {
				return false
			}
			
			return true
		}
	}
}
