//
//  TodoDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.12.25.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: TodoItem
    @State private var todoTitle = ""
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $todoTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .onAppear {
                    focused = true
                }
                .padding()
            
            Spacer()
        }
        .navigationTitle("To-do Detail")
    }
}

#Preview {
    TodoDetailView(todo: TodoItem(title: "Learn iOS development"))
}
