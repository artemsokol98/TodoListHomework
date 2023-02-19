//
//  SectionForTaskManagerAdapter.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 18.02.2023.
//

import Foundation

protocol ISectionForTaskManagerAdapter {
	func getSectionsTitles() -> [String]
	func getTasksForSection(section sectionIndex: Int) -> [Task]
}

final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// This function stores and return titles like array of strings
	func getSectionsTitles() -> [String] {
		return ["Umcompleted", "Completed"]
	}
	
	/// Get tasks by section, returns array of tasks
	func getTasksForSection(section sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 1:
			return taskManager.completedTasks()
		default:
			return taskManager.uncompletedTasks()
		}
	}
}
