import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releaseDate: "1979"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Kung Fu Flick"))
        
        libraryTableView.reloadData()
    }
}

