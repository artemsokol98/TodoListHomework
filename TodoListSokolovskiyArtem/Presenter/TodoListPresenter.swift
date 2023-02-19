//
//  TodoListPresenter.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 18.02.2023.
//

import Foundation

protocol ITodoListPresenterProtocol {
	init(view: ITodoListViewProtocol)
	var sectionForTaskManager: ISectionForTaskManagerAdapter! { get set }
	func getTaskForIndex(_ indexPath: IndexPath) -> Task
	func getSectionsTitlesCount() -> Int
	func getSectionTitle(section: Int) -> String
	func getNumberOfRowsInSection(section: Int) -> Int
}

protocol ITodoListViewProtocol: AnyObject {
	func render(viewData: ViewData)
}

final class TodoListPresenter: ITodoListPresenterProtocol {
	unowned let view: ITodoListViewProtocol
	init(view: ITodoListViewProtocol) {
		self.view = view
		configure()
		view.render(viewData: ViewData(heightForRow: 100.0))
	}
	
	/// Access for taskManager through section
	var sectionForTaskManager: ISectionForTaskManagerAdapter!
	
	private func configure() {
		let taskManager: ITaskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository: IRepository = TaskRepository()
		taskManager.addTasks(tasks: repository.getAllTasks())
		
		sectionForTaskManager = SectionForTaskManagerAdapter(taskManager: taskManager)
	}
	
	/// return Task from indexPath
	func getTaskForIndex(_ indexPath: IndexPath) -> Task {
		sectionForTaskManager.getTasksForSection(section: indexPath.section)[indexPath.row]
	}
	
	/// return number of sections (titles) "Int" type
	func getSectionsTitlesCount() -> Int {
		sectionForTaskManager.getSectionsTitles().count
	}
	
	/// return section title like "String" type
	func getSectionTitle(section: Int) -> String {
		sectionForTaskManager.getSectionsTitles()[section]
	}
	
	/// return number of rows for section "Int" type
	func getNumberOfRowsInSection(section: Int) -> Int {
		sectionForTaskManager.getTasksForSection(section: section).count
	}
}


struct ViewData {
	let heightForRow: CGFloat
}
