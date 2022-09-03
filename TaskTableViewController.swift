//
//  ViewController.swift
//  TaskManedger
//
//  Created by Илья Рехтин on 02.09.2022.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    private var currentFolder = Task(name: "Задачи")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func AddButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Новая задача", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Что нужно сдлевлать?"
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {[weak self] action in
            guard let textfield = alert.textFields?.first else {return}
            let task = Task(name: textfield.text ?? "Отдохнуть")
            self?.currentFolder.addComponent(c: task)
            self?.tableView.reloadData()
        }))
        self.present(alert, animated: true)
    }
}

//MARK: - delegate, datasource
extension TaskTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.currentFolder.contentCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseID, for: indexPath) as! TaskTableViewCell
        let tasks = currentFolder.showContent()
        let item = tasks[indexPath.row]
        cell.configurationCell(item.name, subTaskCount: item.contentCount())
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskTableViewController") as? TaskTableViewController else {return}
        let task = currentFolder.showContent()[indexPath.row]
        vc.navigationItem.title = task.name
        vc.currentFolder = task as! Task
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            self.currentFolder.deleteComponent(at: indexPath.row)
            self.tableView.reloadData()
    }
    
}
