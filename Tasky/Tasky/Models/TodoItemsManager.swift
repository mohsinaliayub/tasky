//
//  TodoItemsManager.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 17.12.25.
//

import Foundation

struct TodoItemsManager {
    private var todoItems: [TodoItem]
    
    init() {
        todoItems = []
        populateDummyItems()
    }
    
    func updateTodoItem(_ item: TodoItem) {
        
    }
    
    func getTodoItem(at index: Int) -> TodoItem {
        todoItems[index]
    }
    
    private mutating func populateDummyItems() {
        todoItems.append(TodoItem(title: "Brush my teeth"))
        todoItems.append(TodoItem(title: "Buy groceries"))
        todoItems.append(TodoItem(title: "Learn iOS development"))
        todoItems.append(TodoItem(title: "Clean the dishes"))
        todoItems.append(TodoItem(title: "Read One Chapter of Harry Potter & the Order of Pheonix"))
    }
}
