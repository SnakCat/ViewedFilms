protocol YoutubeViewModel {
    
    //MARK: - methods
    func saveYoutube(snting: String)
    
    //MARK: - colosure
    var saveYoutubeColosure: ((String) -> Void)? { get set }
}
    //MARK: - class
final class DefaultYoutubeViewModel: YoutubeViewModel {
    
    //MARK: - colosure
    var saveYoutubeColosure: ((String) -> Void)?
    
    //MARK: - methods
    func saveYoutube(snting: String) {
        saveYoutubeColosure?(snting)
    }
}
