protocol FilmNameViewModel {
    func saveName(string: String)
    var saveNameClosure: ((String) -> Void)?  { get set }
}

final class DefaultFilmNameViewModal: FilmNameViewModel {
    
    var saveNameClosure: ((String) -> Void)?
    
    func saveName(string: String) {
        saveNameClosure?(string)
    }
    

}
