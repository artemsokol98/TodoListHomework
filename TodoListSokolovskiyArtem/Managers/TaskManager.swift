//
//  TaskManager.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

class TaskManager {
    static let shared = TaskManager()
    var tasks: [Task] = [
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
