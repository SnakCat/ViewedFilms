protocol ReleaseDataPickerViewModel {
    func saveData(string: String)
    var saveDataColosure: ((String) -> Void)? { get set }
}

final class DefaultReleaseDataPickerViewModel: ReleaseDataPickerViewModel {
    
    var saveDataColosure: ((String) -> Void)?
    
    func saveData(string: String) {
        saveDataColosure?(string)
    }
}
