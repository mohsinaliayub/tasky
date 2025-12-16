//
//  TodoDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.12.25.
//

import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: String
    @FocusState private var focused: Bool
    
    var body: some View {
        TextField("", text: $todo)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .onAppear {
                focused = true
            }
    }
}

#Preview {
    TodoDetailView(todo: .constant("Learn iOS development"))
}
