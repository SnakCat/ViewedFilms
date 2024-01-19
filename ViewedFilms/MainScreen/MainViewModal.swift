protocol MainViewModal {
    func loadMovies()
    var setupMovie: (([Movie]) -> Void)? { get set }
}

final class DefaultMainViewModal: MainViewModal {
    
    var setupMovie: (([Movie]) -> Void)?
    
    func loadMovies() {
        let operationResult = CoreDataManager.instance.loadMovie()
        switch operationResult {
        case .success(let movie):
            setupMovie?(movie)
        case .failure(let failure):
            print(failure)
        }
    }
}
