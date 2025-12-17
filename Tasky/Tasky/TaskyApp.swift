//
//  TaskyApp.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.12.25.
//

import SwiftUI

@main
struct TaskyApp: App {
    @StateObject private var todoItemsVM = InMemoryTodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TodoListView(todoItemsVM: todoItemsVM)
        }
    }
}
