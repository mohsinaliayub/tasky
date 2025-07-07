//
//  TodoItemsManager.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 08.07.25.
//

class TodoItemsManager {
    private(set) var todoItems: [TodoItem]
    
    init() {
        self.todoItems = []
        createDummyTasks()
    }
    
    private func createDummyTasks() {
        todoItems.append(TodoItem(text: "Fajar", completed: true))
        todoItems.append(TodoItem(text: "Duhr", completed: true))
        todoItems.append(TodoItem(text: "Asr"))
        todoItems.append(TodoItem(text: "Maghrib", completed: true))
        todoItems.append(TodoItem(text: "Isha"))
    }
}
