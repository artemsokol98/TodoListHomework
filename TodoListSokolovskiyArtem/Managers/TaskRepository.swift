//
//  TaskRepository.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 15.02.2023.
//

import Foundation

protocol Repository {
    associatedtype T
    
    func create(_ item: T, completionHandler: (Error?)->Void)
    func get(id: Int, completionHandler: (T?, Error?)->Void)
    func list(completionHandler: ([T]?, Error?)->Void)
    func delete(_ item: T, completionHandler: (Error?)->Void)
    func edit(_ item: T, completionHandler: (Error?)->Void)
}

class TaskRepository: Repository {
    typealias T = Task

    private var dataSource: [T]?
    
    
    /// add new element
    func create(_ item: T, completionHandler: (Error?)->Void) {
        dataSource?.append(item)
    }
    
    /// get one element
    func get(id: Int, completionHandler: (T?, Error?)->Void) {
        let item = dataSource?[id]
        completionHandler(item, nil)
    }
    
    /// get all elements
    func list(completionHandler: ([T]?, Error?)->Void) {
        completionHandler(dataSource, nil)
    }

    /// delete element
    func delete(_ item: T, completionHandler: (Error?)->Void) {
        
    }
    
    /// edit element
    func edit(_ item: T, completionHandler: (Error?)->Void) {
        
    }
}
