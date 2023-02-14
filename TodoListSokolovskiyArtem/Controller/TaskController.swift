//
//  TaskController.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

protocol ITaskController {
    var tasks: [Task] { get set }
    func updateTask(at index: Int)
}

class TaskController: ITaskController {
    var tasks = TaskManager.shared.tasks
    
    func updateTask(at index: Int) {
        tasks[index].completed.toggle()
    }
}
