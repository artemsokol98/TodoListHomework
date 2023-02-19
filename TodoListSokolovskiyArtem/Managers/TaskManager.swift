//
//  TaskManager.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

protocol ITaskManager {
	func allTasks() -> [Task]
	func completedTasks() -> [Task]
	func uncompletedTasks() -> [Task]
	func addTasks(tasks: [Task])
}

final class TaskManager: ITaskManager {
	private var taskList = [Task]()
	
	/// Get all tasks
	public func allTasks() -> [Task] {
		taskList
	}
	
	/// Get only completed tasks
	public func completedTasks() -> [Task] {
		taskList.filter { $0.completed }
	}
	
	/// Get only uncompleted tasks
	public func uncompletedTasks() -> [Task] {
		taskList.filter { !$0.completed }
	}
	
	/// This funciton allows you add one your task
	public func addTask(task: Task) {
		taskList.append(task)
	}
	
	/// This function allows you add one or more tasks like array
	public func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}
	
	/// This function allows remove task
	public func removeTask(task: Task) {
		taskList.removeAll { $0 === task }
	}
}
