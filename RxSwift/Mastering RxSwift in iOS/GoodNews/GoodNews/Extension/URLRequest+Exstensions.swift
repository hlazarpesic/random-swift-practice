//
//  URLRequest+Exstensions.swift
//  GoodNews
//
//  Created by Lazar Pešić on 5/4/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Resources<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resources: Resources<T>) -> Observable<T?> {
        return Observable.from(resources.url)
            .flatMap({ url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }).map({ data -> T? in
                return try? JSONDecoder().decode(T.self , from: data)
            }).asObservable()
    }
}
