//
//  InMemoryTodoListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 17.12.25.
//

import Foundation
import Combine

class InMemoryTodoListViewModel: ObservableObject {
    @Published private(set) var todoItems: [TodoItem]
    
    init() {
        todoItems = []
        populateDummyItems()
    }
    
    func updateTodoItem(_ item: TodoItem) {
        guard let indexOfItem = todoItems.firstIndex(of: item) else {
            return
        }
        
        todoItems[indexOfItem] = item
    }
    
    func getTodoItem(at index: Int) -> TodoItem {
        todoItems[index]
    }
    
    private func populateDummyItems() {
        todoItems.append(TodoItem(title: "Brush my teeth"))
        todoItems.append(TodoItem(title: "Buy groceries"))
        todoItems.append(TodoItem(title: "Learn iOS development"))
        todoItems.append(TodoItem(title: "Clean the dishes"))
        todoItems.append(TodoItem(title: "Read One Chapter of Harry Potter & the Order of Pheonix"))
    }
}
