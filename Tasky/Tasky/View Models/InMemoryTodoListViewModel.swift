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
    
    func updateTodoItem(_ item: TodoItem, with title: String) {
        guard let indexOfItem = todoItems.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        
        todoItems[indexOfItem].title = title
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

extension TodoItem: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(title) -- \(id)"
    }
}
