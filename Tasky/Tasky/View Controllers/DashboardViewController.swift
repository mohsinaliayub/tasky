//
//  DashboardViewController.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 07.07.25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet private weak var todoItemsTableView: UITableView!
    @IBOutlet private weak var todayLabel: UILabel!
    
    private let cellReuseIdentifier = "TodoItemCell"
    private var todoItemsManager = TodoItemsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDateLabel()
    }
    
    private func updateDateLabel() {
        let todayDate = Date()
        let components = Calendar.current.dateComponents([.weekday, .day, .month], from: todayDate)
        
        let dayOfWeek = dayOfWeek(for: components.weekday)
        let nameOfMonth = name(for: components.month)
        
        todayLabel.text = dayOfWeek + ", " + nameOfMonth + " " + String(components.day!)
    }
    
    private func dayOfWeek(for day: Int?) -> String {
        switch day {
        case 1: return "Sunday"
        case 2: return "Monday"
        case 3: return "Tuesday"
        case 4: return "Wednesday"
        case 5: return "Thursday"
        case 6: return "Friday"
        case 7: return "Saturday"
        default: return ""
        }
    }
    
    private func name(for month: Int?) -> String {
        switch month {
        case 1: return "January"
        case 2: return "February"
        case 3: return "March"
        case 4: return "April"
        case 5: return "May"
        case 6: return "June"
        case 7: return "July"
        case 8: return "August"
        case 9: return "September"
        case 10: return "October"
        case 11: return "November"
        case 12: return "December"
        default: return ""
        }
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
