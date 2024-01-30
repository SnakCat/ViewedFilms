protocol MainViewModal {
    //MARK: - methods
    func loadMovies()
    func bildAddNewFilmViewController()
    //MARK: - colosures
    var setupMovie: (([Movie]) -> Void)? { get set }
    var inputAddNewFilmView: ((DefaultAddNewFilmView) -> Void)? { get set }
}
    //MARK: - class
final class DefaultMainViewModal: MainViewModal {
    //MARK: - closures
    var inputAddNewFilmView: ((DefaultAddNewFilmView) -> Void)?
    var setupMovie: (([Movie]) -> Void)?
    //MARK: - methods
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

