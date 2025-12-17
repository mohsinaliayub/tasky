//
//  TodoItem.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 17.12.25.
//

import Foundation

/// A task to be performed by a user.
struct TodoItem: Identifiable {
    /// The description for the todo item.
    var title: String
    /// The todo item completion toggle.
    var isCompleted = false
    /// A unique identifier to identify todo items from each other.
    let id = UUID()
}
