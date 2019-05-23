//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Mohammad Azam on 3/3/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            print("Table cell does not exists")
            return UITableViewCell()
        }
        cell.articleTitle.text = articles[indexPath.row].title
        cell.articleDescription.text = articles[indexPath.row].description
        return cell
    }
    
    fileprivate func populateNews() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d55c424a60964bdcb3f0873442b2a766")!
        
//        Observable.just(url)
//            .flatMap({ url -> Observable<Data> in
//                let request = URLRequest(url: url)
//                return URLSession.shared.rx.data(request: request)
//            }).map({ data -> [Article]? in
//                return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
//            }).subscribe(onNext: { [weak self] articles in
//                if let articles = articles {
//                    self?.articles = articles
//                    DispatchQueue.main.async {
//                        self?.tableView.reloadData()
//                    }
//                }
//            }).disposed(by: disposeBag)
//        URLRequest.load(resources: Resources<ArticlesList>(url: url))
        URLRequest.load(resources: ArticlesList.all)
            .subscribe(onNext: { [weak self] result in
                if result != nil {
                    self?.articles = result!.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
}
