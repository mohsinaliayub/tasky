//
//  TodoItemsManager.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 08.07.25.
//

class TodoItemsManager {
    /// A collection of to-do items.
    private var todoItems: [TodoItem]
    
    /// The number of to-do items.
    public var todoItemsCount: Int { todoItems.count }
    
    init() {
        self.todoItems = []
        createDummyTasks()
    }
    
    /// Returns the to-do item at specified position.
    /// - Parameter index: The position to find a to-do item. index must be a valid index of the array.
    /// - Returns: A to-do item at the specified position.
    public func item(at index: Int) -> TodoItem {
        todoItems[index]
    }
    
    /// Adds a to-do item to the collection.
    public func add(item: TodoItem) {
        todoItems.append(item)
    }
    
    /// Removes and returns the to-do item at the specified position.
    /// - Parameter index: The position of the element to remove. index must be a valid index of the array.
    /// - Returns: The to-do item at the specified index.
    public func removeItem(at index: Int) -> TodoItem {
        todoItems.remove(at: index)
    }
    
    private func createDummyTasks() {
        todoItems.append(TodoItem(text: "Fajar", completed: true))
        todoItems.append(TodoItem(text: "Duhr", completed: true))
        todoItems.append(TodoItem(text: "Asr"))
        todoItems.append(TodoItem(text: "Maghrib", completed: true))
        todoItems.append(TodoItem(text: "Isha"))
    }
}
