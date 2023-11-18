//
//  TodoItem.swift
//  TODOList3
//
//  Created by user on 11/11/23.
//

import Foundation

struct TodoItem:  Identifiable, Equatable {
    var name: String
    var isCompleted: Bool = false
    var id: UUID = UUID()
}
