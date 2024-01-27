import UIKit
import PhotosUI

protocol AddNewFilmViewModel {
    func changeNameView()
    func changeRatingView()
    func changeReleaseView()
    func changeYoutubeView()
    func saveNewFilmInCoreData(imageFilm: Data?, nameFilm: String?, retingFilm: String?, releasData: String?, youtube: String?, description: String?)
    var saveNewFilmColosure: ((UIAlertController) -> Void)? { get set }
    var transitionNameView: ((FilmNameView) -> Void)? { get set }
    var transitionRatingView: ((RatingDataPikerView) -> Void)? { get set }
    var transitionReleaseView: ((ReleaseDataPickerView) -> Void)? { get set }
    var transitionYoutubeView: ((YoutubeView) -> Void)? { get set }
    
    
    func openAlertButtonTapped()
    func openGalery()
    
    var setupAlert: ((UIAlertController) -> Void)? { get set }
    var setupPicker: ((PHPickerViewController) -> Void)? { get set }
    
}

final class DefaultAddNewFilmViewModal: AddNewFilmViewModel {
    
    var saveNewFilmColosure: ((UIAlertController) -> Void)?
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
        let filmNameViewModel = DefaultFilmNameViewModal()
        filmNameView.viewModel = filmNameViewModel
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
    
    func saveNewFilmInCoreData(imageFilm: Data?, nameFilm: String?, retingFilm: String?, releasData: String?, youtube: String?, description: String?) {
        let alertSuccses = UIAlertController(title: nil, message: "add Movie", preferredStyle: .alert)
        alertSuccses.addAction(UIAlertAction(title: "ok", style: .default, handler: { _ in
            
        }))
        let alertError = UIAlertController(title: nil, message: "Error", preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "ok", style: .destructive, handler: { _ in
            
        }))
        
        guard let imageFilm = imageFilm,
              let nameFilm = nameFilm,
              let retingFilm = retingFilm,
              let releasData = releasData,
              let youtube = youtube,
              let description = description
        else { return }
        
        let result = CoreDataManager.instance.saveMovie(imageFilm: imageFilm, filmName: nameFilm, reating: retingFilm, releaseData: releasData, youtubeLink: youtube, descriptionFilm: description)
        
        saveNewFilmColosure?(alertSuccses)
        
    }
}

