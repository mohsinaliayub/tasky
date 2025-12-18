//
//  TodoDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.12.25.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: TodoItem
    @EnvironmentObject private var todoItemsVM: InMemoryTodoListViewModel
    @State private var todoTitle = ""
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $todoTitle)
                .focused($focused)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .onChange(of: todoTitle) {
                    todoItemsVM.updateTodoItem(todo, with: todoTitle)
                }
                .onAppear {
                    focused = true
                    todoTitle = todo.title
                }
            
            Spacer()
        }
        .padding()
        .navigationTitle("To-do Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @ObservedObject var vm = InMemoryTodoListViewModel()
    
    TodoDetailView(todo: TodoItem(title: "Learn iOS development"))
        .environmentObject(vm)
}
