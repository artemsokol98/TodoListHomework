//
//  DateFormatter.swift
//  TodoListSokolovskiyArtem
//
//  Created by Артем Соколовский on 12.02.2023.
//

import Foundation

extension Date {
    func convertDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
