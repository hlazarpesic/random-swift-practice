//
//  Article.swift
//  GoodNews
//
//  Created by Lazar Pešić on 5/4/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resources<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d55c424a60964bdcb3f0873442b2a766")!
        return Resources(url: url)
    }()
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
