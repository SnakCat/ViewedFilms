//import UIKit
//import PhotosUI
//
//protocol AddNewFilmViewModel {
//    func openAlertButtonTapped()
//    func openGalery()
//    
//    var setupImage: ((UIImage) -> UIImage)? { get set }
//    
//}
//
//final class DefaultAddNewFilmViewModal: AddNewFilmViewModel {
//    var setupImage: ((UIImage) -> UIImage)?
//    
//    func openAlertButtonTapped() {
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
//            print("Open Camera")
//        }))
//        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
//            self.openGalery()
//        }))
//        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
//        present(alert, animated: true)
//    }
//    
//    func openGalery() {
//        var configuretor = PHPickerConfiguration(photoLibrary: .shared())
//        configuretor.filter = .images
//        configuretor.selectionLimit = 1
//        let picker = PHPickerViewController(configuration: configuretor)
//        picker.delegate = self
//        present(picker, animated: true)
//    }
//    
//    
//}
//
//extension DefaultAddNewFilmViewModal: PHPickerViewControllerDelegate {
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        let itemProvider = results.first?.itemProvider
//        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
//            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
//                if let image = image as? UIImage {
//                    DispatchQueue.main.async {
//                        setupImage?.self = image
//                        self.openAlertButton.setImage(UIImage(), for: .normal)
//                    }
//                }
//            }
//        }
//        dismiss(animated: true)
//    }
//}
