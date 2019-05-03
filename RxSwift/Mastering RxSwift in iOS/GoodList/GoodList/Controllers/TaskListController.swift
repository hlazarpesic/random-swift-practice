//
//  ViewController.swift
//  GoodList
//
//  Created by Lazar Pešić on 5/3/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var tasks = BehaviorRelay<[Task]>(value: [])
    fileprivate var filteredTasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        tableView.delegate = self
        tableView.dataSource = self
        
        prioritySegmentedControl.rx.selectedSegmentIndex.subscribe({ [weak self] event in
            if event.element != nil {
                self?.filterTasks(by: Priority(rawValue: event.element! - 1))
            }
        }).disposed(by: disposeBag)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewTaskCell", for: indexPath)
        cell.textLabel?.text = filteredTasks[indexPath.row].title
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navVC = segue.destination as? UINavigationController, let addTaskVC = navVC.viewControllers.first as? AddTaskViewController else {
            print("Controller not found")
            return
        }
        
        addTaskVC.taskSubjectObservable.subscribe(onNext: { [weak self] task in
            guard let self = self else {return}
            
            let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex - 1)
            
            var value = self.tasks.value
            value.append(task)
            self.tasks.accept(value)
            self.filterTasks(by: priority)
        }).disposed(by: disposeBag)
    }
    
    fileprivate func filterTasks(by priority: Priority?) {
        if priority == nil {
            filteredTasks = tasks.value
        } else {
            filteredTasks = tasks.value.filter({ $0.priority == priority!})
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

