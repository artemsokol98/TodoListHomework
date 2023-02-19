//
//  ViewController.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import UIKit

final class ViewController: UIViewController {
	
	/// Access to presenter
	var presenter: ITodoListPresenterProtocol!
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
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
		presenter.getSectionsTitlesCount()
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		presenter.getSectionTitle(section: section)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter.getNumberOfRowsInSection(section: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
		cell.checkBoxButtonDelegate = self
		let task = presenter.getTaskForIndex(indexPath)
		
		if let currentTask = task as? RegularTask {
			cell.configureRegularCell(task: currentTask, indexTable: indexPath)
		} else {
			guard let importantTask = task as? ImportantTask else { return UITableViewCell() }
			cell.configureImportantCell(task: importantTask, indexTable: indexPath)
		}
		return cell
	}
}

extension ViewController: ICheckBoxButtonDelegate {
	
	/// Update state of task in TaskController, when user interacts with UI
	func changedState(for task: IndexPath) {
		let task = presenter.getTaskForIndex(task)
		task.completed.toggle()
		tableView.reloadData()
	}
}

extension ViewController: ITodoListViewProtocol {
	func render(viewData: ViewData) {
		
	}
}

