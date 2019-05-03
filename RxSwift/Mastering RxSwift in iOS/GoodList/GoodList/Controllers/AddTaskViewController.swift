//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Lazar Pešić on 5/3/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddTaskViewController: UIViewController {
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var segmentedControlPriority: UISegmentedControl!
    @IBOutlet weak var taskTextField: UITextField!
    
    fileprivate let taskSubject = PublishSubject<Task>()
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        saveBarButton.rx.tap.subscribe(onNext:{ [weak self] _ in
            guard let priority = Priority(rawValue: (self?.segmentedControlPriority.selectedSegmentIndex) ?? 0), let text = self?.taskTextField.text else {
                return
            }
            let task = Task(title: text, priority: priority)
            self?.taskSubject.onNext(task)
            self?.dismiss(animated: true, completion: nil )
        }).disposed(by: disposeBag)
    }
    
    deinit {
        print("AddTaskViewController is being deinitialized")
    }
}
