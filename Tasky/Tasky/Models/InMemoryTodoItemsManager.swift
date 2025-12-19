//
//  InMemoryTodoItemsManager.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 17.12.25.
//

import Foundation

struct InMemoryTodoItemsManager {
    private(set) var todoItems: [TodoItem]
    
    init() {
        todoItems = []
        populateDummyItems()
    }
    
    mutating func updateTodoItem(_ todoItem: TodoItem, with title: String) {
        guard let indexOfItem = index(of: todoItem) else { return }
        
        todoItems[indexOfItem].title = title
    }
    
    mutating func updateIsCompleteStatus(_ isComplete: Bool, for todoItem: TodoItem) {
        guard let indexOfItem = index(of: todoItem) else { return }
        
        todoItems[indexOfItem].isCompleted = isComplete
    }
    
    mutating func deleteTodoItem(_ todoItem: TodoItem) {
        guard let indexOfItem = index(of: todoItem) else { return }
        
        _ = todoItems.remove(at: indexOfItem)
    }
    
    func getTodoItem(at index: Int) -> TodoItem {
        todoItems[index]
    }
    
    private func index(of item: TodoItem) -> Int? {
        // Not going to use 'firstIndex(of:)', because with our implementation
        // of 'Equatable' won't work on it.
        todoItems.firstIndex { $0.id == item.id }
    }
    
    private mutating func populateDummyItems() {
        todoItems.append(TodoItem(title: "Brush my teeth"))
        todoItems.append(TodoItem(title: "Buy groceries"))
        todoItems.append(TodoItem(title: "Learn iOS development"))
        todoItems.append(TodoItem(title: "Clean the dishes"))
        todoItems.append(TodoItem(title: "Read One Chapter of Harry Potter & the Order of Pheonix"))
    }
}
