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
            List {
                ForEach(todoItemsVM.todoItems) { todoItem in
                    NavigationLink(destination: TodoDetailView(todo: todoItem).environmentObject(todoItemsVM)) {
                        TodoInfoView(todo: todoItem)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(action: { todoItemsVM.deleteTodoItem(todoItem) }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button(action: {
                                    todoItemsVM.updateIsCompleteStatus(!todoItem.isCompleted, for: todoItem)
                                }) {
                                    if todoItem.isCompleted {
                                        Label("Incomplete", systemImage: "checkmark.circle.dotted")
                                    } else {
                                        Label("Complete", systemImage: "checkmark.circle.fill")
                                    }
                                }
                            }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
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
            title.padding(.vertical, 8)
            Divider()
        }
        .foregroundStyle(todo.isCompleted ? .gray.opacity(0.7) : .primary)
    }
    
    var title: some View {
        Text(todo.title)
            .font(.body)
            .kerning(1)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay {
                if todo.isCompleted {
                    Rectangle()
                        .fill(.black)
                        .frame(height: 1)
                }
            }
    }
}

#Preview {
    TodoListView(todoItemsVM: InMemoryTodoListViewModel())
}
