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
    
    func updateIsCompleteStatus(_ isComplete: Bool, for todoItem: TodoItem) {
        todoManager.updateIsCompleteStatus(isComplete, for: todoItem)
    }
    
    func deleteTodoItem(_ todoItem: TodoItem) {
        todoManager.deleteTodoItem(todoItem)
    }
}

extension TodoItem: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(title) -- \(id)"
    }
}
