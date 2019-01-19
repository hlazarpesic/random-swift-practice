//
//  ViewController.swift
//  Coordinator pattern
//
//  Created by Hadži Lazar Pešić on 1/19/19.
//  Copyright © 2019 Lazar Pešić. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboard {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buyTapped(_ sender: UIButton) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
}

