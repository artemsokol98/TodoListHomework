//
//  TaskController.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

protocol ITaskController {
    var taskManager: TaskManager { get set }
    func updateTask(at index: Int)
}

class TaskController: ITaskController {
    
    var taskManager: TaskManager
    
    init() {
        taskManager = TaskManager()
    }
    
    func updateTask(at index: Int) {
        //taskManager.repository.edit(<#T##item: TaskRepository.T##TaskRepository.T#>, completionHandler: <#T##(Error?) -> Void#>)
    }
}
