//
//  TodoListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.12.25.
//

import SwiftUI

struct TodoListView: View {
    @State private var todos = [
        "Brush my teeth",
        "Buy groceries",
        "Learn iOS development",
        "Clean the dishes",
        "Read one chapter of Harry Potter & the Order of Pheonix"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(todos, id: \.self) { todo in
                        TodoInfoView(todo: todo)
                    }
                }
            }
            .padding()
            .navigationTitle("To-dos")
        }
    }
}

struct TodoInfoView: View {
    let todo: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo)
                .font(.body)
                .kerning(1)
                .padding(.vertical, 8)
            Divider()
        }
    }
}

#Preview {
    TodoListView()
}
