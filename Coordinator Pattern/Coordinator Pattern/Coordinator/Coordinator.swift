//
//  Coordinator.swift
//  Coordinator pattern
//
//  Created by Hadži Lazar Pešić on 1/19/19.
//  Copyright © 2019 Lazar Pešić. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
