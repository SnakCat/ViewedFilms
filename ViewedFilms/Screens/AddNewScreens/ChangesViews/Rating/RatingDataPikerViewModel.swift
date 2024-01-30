protocol RatingDataPikerViewModel {
    
    //MARK: - methods
    func saveRating(string: String)
    
    //MARK: - colosure
    var saveRatingColosure: ((String) -> Void)? { get set }
}

    //MARK: - class
final class DefaultRatingDataPikerViewModel: RatingDataPikerViewModel {
    
    //MARK: - colosure
    var saveRatingColosure: ((String) -> Void)?
    
    //MARK: - methods
    func saveRating(string: String) {
        saveRatingColosure?(string)
    }
}
