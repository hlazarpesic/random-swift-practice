//
//  Repository.swift
//  RepositoryDemo
//
//  Created by Hadži Lazar Pešić on 7/3/19.
//  Copyright © 2019 Lazar Pešić. All rights reserved.
//

import Foundation

final class Repository: Singleton {
    static var instance: Repository = Repository()
    
    fileprivate init() { }
    
    let apiDataStore = APIDataStore.instance
    
}
