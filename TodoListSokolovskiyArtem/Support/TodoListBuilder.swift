//
//  TodoListBuilder.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 18.02.2023.
//

import UIKit

protocol ITodoListBuilderProtocol {
	static func buildMainModule() -> UIViewController
}

class TodoListBuilder: ITodoListBuilderProtocol {
	/// Create and configure module for app
	static func buildMainModule() -> UIViewController {
		let view = ViewController()
		let presenter = TodoListPresenter(view: view)
		view.presenter = presenter
		return view
	}
}
