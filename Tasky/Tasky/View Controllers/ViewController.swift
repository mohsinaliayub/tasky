//
//  ViewController.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 07.07.25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var todoItemsTableView: UITableView!
    
    private let cellReuseIdentifier = "TodoItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
