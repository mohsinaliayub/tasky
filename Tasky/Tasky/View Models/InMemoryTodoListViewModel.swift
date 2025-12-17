//
//  InMemoryTodoListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 17.12.25.
//

import Foundation
import Combine

class InMemoryTodoListViewModel: ObservableObject {
    @Published private var todoManager = TodoItemsManager()
    
    var todoItems: [TodoItem] {
        todoManager.todoItems
    }
    
    func updateTodoItem(_ item: TodoItem, with title: String) {
        todoManager.updateTodoItem(item, with: title)
    }
}

extension TodoItem: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(title) -- \(id)"
    }
}
