protocol FilmNameViewModel {
    
    //MARK: - nethods
    func saveName(string: String)
    
    //MARK: - colosure
    var saveNameClosure: ((String) -> Void)?  { get set }
}

    //MARK: - class
final class DefaultFilmNameViewModal: FilmNameViewModel {
    
    //MARK: - colosure
    var saveNameClosure: ((String) -> Void)?
    
    //MARK: - nethods
    func saveName(string: String) {
        saveNameClosure?(string)
    }
}
