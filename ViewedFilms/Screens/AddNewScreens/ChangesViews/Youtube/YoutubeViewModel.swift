protocol YoutubeViewModel {
    func saveYoutube(snting: String)
    var saveYoutubeColosure: ((String) -> Void)? { get set }
}

final class DefaultYoutubeViewModel: YoutubeViewModel {
    
    var saveYoutubeColosure: ((String) -> Void)?
    
    func saveYoutube(snting: String) {
        saveYoutubeColosure?(snting)
    }
}
