import UIKit
import PhotosUI

protocol ChangesViewProtocol {
    
}

protocol AddNewFilmViewModel {
    func changeNameView()
    func changeRatingView()
    func changeReleaseView()
    func changeYoutubeView()
    
    var transitionNameView: ((FilmNameView) -> Void)? { get set }
    var transitionRatingView: ((RatingDataPikerView) -> Void)? { get set }
    var transitionReleaseView: ((ReleaseDataPickerView) -> Void)? { get set }
    var transitionYoutubeView: ((YoutubeView) -> Void)? { get set }
    
    
    func openAlertButtonTapped()
    func openGalery()
    
    var setupAlert: ((UIAlertController) -> Void)? { get set }
    var setupPicker: ((PHPickerViewController) -> Void)? { get set }
    
}

final class DefaultAddNewFilmViewModal: AddNewFilmViewModel, FilmNameViewModel {
    
    var transitionNameView: ((FilmNameView) -> Void)?
    var transitionRatingView: ((RatingDataPikerView) -> Void)?
    var transitionReleaseView: ((ReleaseDataPickerView) -> Void)?
    var transitionYoutubeView: ((YoutubeView) -> Void)?
    
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
    func changeNameView() {
        let filmNameView = FilmNameView()
        let filmAddNewFilmViewModel = DefaultAddNewFilmViewModal()
        filmNameView.viewModel = filmAddNewFilmViewModel
        transitionNameView?(filmNameView)
    }
    
    func changeRatingView() {
        let ratingDataPickerView = RatingDataPikerView()
        let ratingDataPickerViewModel = DefaultRatingDataPikerViewModel()
        ratingDataPickerView.viewModel = ratingDataPickerViewModel
        transitionRatingView?(ratingDataPickerView)
    }
    
    func changeReleaseView() {
        let releaseDataPickerView = ReleaseDataPickerView()
        let releaseDataPickerViewModel = DefaultReleaseDataPickerViewModel()
        releaseDataPickerView.viewModel = releaseDataPickerViewModel
        transitionReleaseView?(releaseDataPickerView)
    }
    
    func changeYoutubeView() {
        let youtubeView = YoutubeView()
        let youtubeViewModel = DefaultYoutubeViewModel()
        youtubeView.viewModel = youtubeViewModel
        transitionYoutubeView?(youtubeView)
    }
}

