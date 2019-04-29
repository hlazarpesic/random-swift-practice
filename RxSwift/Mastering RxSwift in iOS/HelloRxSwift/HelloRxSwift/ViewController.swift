//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Lazar Pešić on 4/29/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Observable.from([1,2,3,4,5 ])
    }


}

