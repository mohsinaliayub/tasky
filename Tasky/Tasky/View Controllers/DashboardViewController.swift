//
//  DashboardViewController.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 07.07.25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet private weak var todoItemsTableView: UITableView!
    
    private let cellReuseIdentifier = "TodoItemCell"
    private var todoItemsManager = TodoItemsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoItemsManager.todoItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let item = todoItemsManager.item(at: indexPath.row)
        configureCell(cell, for: item)
        
        return cell
    }
    
    private func configureCell(_ cell: UITableViewCell, for item: TodoItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        let imageView = cell.viewWithTag(1001) as! UIImageView
        
        label.text = item.text
        let imageName = item.completed ? "checkmark.circle.fill" : "circle.dotted"
        imageView.image = UIImage(systemName: imageName)
    }
}

extension DashboardViewController: UITableViewDelegate {
    
}
