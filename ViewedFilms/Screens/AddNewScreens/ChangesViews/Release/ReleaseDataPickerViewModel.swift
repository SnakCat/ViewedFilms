protocol ReleaseDataPickerViewModel {
    
    //MARK: - methods
    func saveData(string: String)
    
    //MARK: - colosure
    var saveDataColosure: ((String) -> Void)? { get set }
}
    //MARK: - class
final class DefaultReleaseDataPickerViewModel: ReleaseDataPickerViewModel {
    
    //MARK: - colosure
    var saveDataColosure: ((String) -> Void)?
    
    //MARK: - methods
    func saveData(string: String) {
        saveDataColosure?(string)
    }
}
