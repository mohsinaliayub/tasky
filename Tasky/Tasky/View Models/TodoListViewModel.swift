//
//  TodoListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 17.12.25.
//

import Foundation
import SwiftUI

@Observable
class TodoListViewModel {
    private var todoManager = InMemoryTodoItemsManager()
    
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

extension EnvironmentValues {
    var todoListVM: TodoListViewModel {
        get { self[TodoListViewModelKey.self] }
        set { self[TodoListViewModelKey.self] = newValue }
    }
}

fileprivate struct TodoListViewModelKey: EnvironmentKey {
    static var defaultValue = TodoListViewModel()
}

extension TodoItem: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(title) -- \(id)"
    }
}
