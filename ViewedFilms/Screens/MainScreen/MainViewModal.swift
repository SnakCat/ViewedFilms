protocol MainViewModal {
    func loadMovies()
    func bildAddNewFilmViewController()
    
    var setupMovie: (([Movie]) -> Void)? { get set }
    var inputAddNewFilmView: ((DefaultAddNewFilmView) -> Void)? { get set }
}

final class DefaultMainViewModal: MainViewModal {
    var inputAddNewFilmView: ((DefaultAddNewFilmView) -> Void)?
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
    func bildAddNewFilmViewController() {
        let addNewView = DefaultAddNewFilmView()
        let addNewFilmViewModel = DefaultAddNewFilmViewModal()
        addNewView.viewModel = addNewFilmViewModel
        inputAddNewFilmView?(addNewView)
    }
}
