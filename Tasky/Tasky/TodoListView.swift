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
                VStack(alignment: .leading) {
                    ForEach(todos, id: \.self) { todo in
                        Text(todo)
                            .font(.body)
                            .kerning(1)
                            .padding(.vertical, 8)
                        Divider()
                    }
                }
            }
            .padding()
            .navigationTitle("To-dos")
        }
    }
}

#Preview {
    TodoListView()
}
