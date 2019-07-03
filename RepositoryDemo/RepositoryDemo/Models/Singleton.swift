//
//  Singleton.swift
//  RepositoryDemo
//
//  Created by Hadži Lazar Pešić on 7/3/19.
//  Copyright © 2019 Lazar Pešić. All rights reserved.
//

import Foundation

protocol Singleton {
    static var instance: Self { get }
}
