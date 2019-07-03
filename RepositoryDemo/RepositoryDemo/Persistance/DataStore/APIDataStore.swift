//
//  ApiDataStore.swift
//  RepositoryDemo
//
//  Created by Hadži Lazar Pešić on 7/3/19.
//  Copyright © 2019 Lazar Pešić. All rights reserved.
//

import Foundation
import RxSwift

final class APIDataStore: Singleton {
    static var instance: APIDataStore = APIDataStore()
    
    fileprivate init() { }
}
