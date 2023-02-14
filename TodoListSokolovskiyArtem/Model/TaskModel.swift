//
//  Task.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

class Task {
    let title: String
    var completed: Bool
    
    init(title: String, completed: Bool) {
        self.title = title
        self.completed =  completed
    }
}

class RegularTask: Task {
    override init(title: String, completed: Bool) {
        super.init(title: title, completed: completed)
    }
}

class ImportantTask: Task {
    let priority: Priorities
    
    init(priority: Priorities, title: String, completed: Bool) {
        self.priority = priority
        super.init(title: title, completed: completed)
    }
    
    var deadline: Date {
        switch priority {
        case .high: return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        case .medium: return Calendar.current.date(byAdding: .day, value: 2, to: Date())!
        case .low: return Calendar.current.date(byAdding: .day, value: 3, to: Date())!
        }
    }
}
