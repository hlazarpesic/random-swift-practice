import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    fileprivate var articleListVM: ArticleListViewModel!
    fileprivate let db = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM == nil ? 0 : articleListVM.articlesVM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        
        let articleVM = articleListVM.articleAt(index: indexPath.row)
        
         articleVM.title.asObservable()
            .bind(to: cell.titleLabel.rx.text)
            .disposed(by: db)
        
        articleVM.description.asObservable()
            .bind(to: cell.descriptionLabel.rx.text)
            .disposed(by: db)
        return cell
    }
    
    fileprivate func populateNews() {
        let resource = Resource<ArctileResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d55c424a60964bdcb3f0873442b2a766")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                let articles = articleResponse.articles
                self.articleListVM = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: db )
    }
}
