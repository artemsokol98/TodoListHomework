//
//  ViewController.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var taskController: ITaskController!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        taskController = TaskController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Completed tasks"
        case 1: return "Uncompleted tasks"
        default: return "This section doesn't exist"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows: Int?
        switch section {
        case 0: taskController.taskManager.repository.list(completionHandler: { list, error in
            numberOfRows = list?.filter { $0.completed == true }.count
        })
        case 1: taskController.taskManager.repository.list(completionHandler: { list, error in
            numberOfRows = list?.filter { $0.completed == false }.count
        })
        default: return 0
        }
        guard let rows = numberOfRows else { return 0 }
        return rows
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        cell.checkBoxButtonDelegate = self
        
        taskController.taskManager.repository.get(id: indexPath.row, completionHandler: { task, error in
            if let currentTask = task as? RegularTask {
                cell.configureRegularCell(task: currentTask, indexTable: indexPath.row + indexPath.section * tableView.numberOfRows(inSection: indexPath.section))
            } else {
                guard let importantTask = task as? ImportantTask else { return }
                cell.configureImportantCell(task: importantTask, indexTable: indexPath.row + indexPath.section * tableView.numberOfRows(inSection: indexPath.section))
            }
        })
        return cell
    }
}

extension ViewController: ICheckBoxButtonDelegate {
    
    /// Update state of task in TaskController, when user interacts with UI
    func changedState(for task: Int) {
        taskController.updateTask(at: task)
        tableView.reloadData()
    }
}

