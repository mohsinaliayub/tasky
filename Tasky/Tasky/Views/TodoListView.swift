//
//  TodoListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.12.25.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var todoItemsVM: InMemoryTodoListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(todoItemsVM.todoItems) { todoItem in
                        NavigationLink(destination: TodoDetailView(todo: todoItem).environmentObject(todoItemsVM)) {
                            TodoInfoView(todo: todoItem)
                        }
                    }
                }
            }
            .padding()
            .foregroundStyle(.primary)
            .navigationTitle("To-dos")
        }
    }
}

struct TodoInfoView: View {
    let todo: TodoItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.title)
                .font(.body)
                .kerning(1)
                .padding(.vertical, 8)
                .multilineTextAlignment(.leading)
            Divider()
        }
    }
}

#Preview {
    TodoListView(todoItemsVM: InMemoryTodoListViewModel())
}
