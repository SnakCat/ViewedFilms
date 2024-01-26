protocol RatingDataPikerViewModel {
    func saveRating(string: String)
    var saveRatingColosure: ((String) -> Void)? { get set }
}

final class DefaultRatingDataPikerViewModel: RatingDataPikerViewModel {
    
    var saveRatingColosure: ((String) -> Void)?
    
    func saveRating(string: String) {
        saveRatingColosure?(string)
    }
}
