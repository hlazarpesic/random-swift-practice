import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.title == rhs.title &&
        lhs.releaseDate == rhs.releaseDate
}
