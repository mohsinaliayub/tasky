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
                    todoCellWithSwipeActions(todoItem)
                        .overlay {
                            NavigationLink(destination: { TodoDetailView(todo: todoItem).environmentObject(todoItemsVM) }) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 0))
            }
            .listStyle(.plain)
            .padding()
            .foregroundStyle(.primary)
            .navigationTitle("To-dos")
        }
    }
    
    func todoCellWithSwipeActions(_ todoItem: TodoItem) -> some View {
        TodoInfoView(todo: todoItem)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                deleteTodoItemButton(todoItem)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                toggleIsCompleteButton(todoItem)
            }
    }
    
    func deleteTodoItemButton(_ todoItem: TodoItem) -> some View {
        Button(action: { todoItemsVM.deleteTodoItem(todoItem) }) {
            Label("Delete", systemImage: "trash")
        }
    }
    
    func toggleIsCompleteButton(_ todoItem: TodoItem) -> some View {
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

struct TodoInfoView: View {
    let todo: TodoItem
    
    var body: some View {
        VStack(alignment: .leading) {
            title.padding(.vertical, 12)
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
