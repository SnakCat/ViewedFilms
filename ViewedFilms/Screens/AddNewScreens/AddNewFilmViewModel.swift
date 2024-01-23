import UIKit
import PhotosUI

protocol AddNewFilmViewModel {
    func openAlertButtonTapped()
    func openGalery()
    
    var setupAlert: ((UIAlertController) -> Void)? { get set }
    var setupPicker: ((PHPickerViewController) -> Void)? { get set }
    
}

final class DefaultAddNewFilmViewModal: AddNewFilmViewModel {
    
    var setupAlert: ((UIAlertController) -> Void)?
    var setupPicker: ((PHPickerViewController) -> Void)?
    
    func openAlertButtonTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            print("Open Camera")
        }))
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        setupAlert?(alert)
    }
    
    func openGalery() {
        var configuretor = PHPickerConfiguration(photoLibrary: .shared())
        configuretor.filter = .images
        configuretor.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuretor)
        setupPicker?(picker)
    }
}

