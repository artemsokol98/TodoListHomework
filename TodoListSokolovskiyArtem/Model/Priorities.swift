//
//  Priorities.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

enum Priorities: Int {
	case low
	case medium
	case high
	
	var description: CustomStringConvertible {
		switch self {
		case .low:
			return "Low"
		case .medium:
			return "Medium"
		case .high:
			return "High"
		}
	}
}
