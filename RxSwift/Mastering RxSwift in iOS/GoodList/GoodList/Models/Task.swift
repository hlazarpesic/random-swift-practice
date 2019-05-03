//
//  Task.swift
//  GoodList
//
//  Created by Lazar Pešić on 5/3/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
