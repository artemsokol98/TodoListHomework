//
//  TaskTableViewCell.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import UIKit

protocol ICheckBoxButtonDelegate {
    func changedState(for task: Int)
}

class TaskTableViewCell: UITableViewCell {
    
    static let identifier = "TaskTableViewCell"
    
    private var index: Int!
    private var state: Bool!
    
    var checkBoxButtonDelegate: ICheckBoxButtonDelegate?
    
    private lazy var checkBox: UIButton = {
        let checkBox = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        checkBox.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        checkBox.layer.borderWidth = 3
        checkBox.layer.cornerRadius = 2
        if state {
            checkBox.backgroundColor = .blue
        } else {
            checkBox.backgroundColor = .white
        }
        checkBox.addTarget(self, action: #selector(changeCompletion), for: .touchUpInside)
        return checkBox
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var labelPriority: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var labelDeadline: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(checkBox)
        contentView.addSubview(label)
        contentView.addSubview(labelPriority)
        contentView.addSubview(labelDeadline)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        labelPriority.translatesAutoresizingMaskIntoConstraints = false
        labelDeadline.translatesAutoresizingMaskIntoConstraints = false
        
        let checkBoxConstraints = [
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.1)
        ]
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.bounds.width * 0.1),
        ]
        
        let labelPriorityConstraints = [
            labelPriority.topAnchor.constraint(equalTo: label.bottomAnchor),
            labelPriority.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.bounds.width * 0.1)
        ]
        
        let labelDeadlineConstraints = [
            labelDeadline.topAnchor.constraint(equalTo: labelPriority.bottomAnchor),
            labelDeadline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.bounds.width * 0.1),
            labelDeadline.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(checkBoxConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(labelPriorityConstraints)
        NSLayoutConstraint.activate(labelDeadlineConstraints)
    }
    
    @objc private func changeCompletion() {
        checkBoxButtonDelegate?.changedState(for: index)
        if checkBox.backgroundColor == .white {
            checkBox.backgroundColor = .blue
        } else {
            checkBox.backgroundColor = .white
        }
    }
    
    /// Use this method for configure cell for Regular Task
    func configureRegularCell(task: RegularTask, indexTable: Int) {
        index = indexTable
        state = task.completed
        label.text = task.title
    }
    
    /// Use this method for configure cell for Important Task
    func configureImportantCell(task: ImportantTask, indexTable: Int) {
        index = indexTable
        state = task.completed
        label.text = task.title
        labelPriority.text = "Priority: \(task.priority.description)"
        labelDeadline.text = "Deadline: \(task.deadline.convertDateToString())"
    }
}
