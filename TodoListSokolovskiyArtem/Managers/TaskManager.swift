//
//  TaskManager.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

protocol ITaskManager {
    var repository: TaskRepository { get set }
}

class TaskManager: ITaskManager {
    var repository: TaskRepository
    
    init() {
        repository = TaskRepository()
        repository.create(RegularTask(title: "Buy Milk", completed: true)) { error in
            print(error ?? "error")
        }
        repository.create(ImportantTask(priority: .low, title: "Food", completed: true)) { error in
            print(error ?? "error")
        }
        repository.create(RegularTask(title: "Buy Car", completed: false)) { error in
            print(error ?? "error")
        }
        repository.create(ImportantTask(priority: .medium, title: "Water", completed: false)) { error in
            print(error ?? "error")
        }
        repository.create(RegularTask(title: "Meet with Friends", completed: true)) { error in
            print(error ?? "error")
        }
        repository.create(ImportantTask(priority: .high, title: "Application", completed: true)) { error in
            print(error ?? "error")
        }
        repository.create(RegularTask(title: "Watch Star Wars", completed: false)) { error in
            print(error ?? "error")
        }
        repository.create(RegularTask(title: "Feed cat", completed: true)) { error in
            print(error ?? "error")
        }
        repository.create(RegularTask(title: "Do homework", completed: false)) { error in
            print(error ?? "error")
        }
    }
}
