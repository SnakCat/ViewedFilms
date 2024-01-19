import UIKit
import PhotosUI

final class DefaultAddNewFilmView: UIViewController {
    
    //MARK: - properties
    private let addImageView = UIImageView()
    private let openAlertButton = UIButton()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupConstreints()
        setupUI()
    }
    
    //MARK: - add Sub View
    private func addSubView() {
        view.addSubviews(addImageView, openAlertButton)
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 167),
            addImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addImageView.widthAnchor.constraint(equalToConstant: 150),
            addImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        openAlertButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openAlertButton.topAnchor.constraint(equalTo: addImageView.topAnchor),
            openAlertButton.leadingAnchor.constraint(equalTo: addImageView.leadingAnchor),
            openAlertButton.trailingAnchor.constraint(equalTo: addImageView.trailingAnchor),
            openAlertButton.bottomAnchor.constraint(equalTo: addImageView.bottomAnchor)
        ])
        
    }
    
    //MARK: - UI
    private func setupUI() {
        title = "Add new"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save)
        
        addImageView.backgroundColor = .backgroundAdd
        addImageView.layer.cornerRadius = 75
        addImageView.layer.masksToBounds = true
        
        openAlertButton.backgroundColor = .clear
        openAlertButton.addTarget(self, action: #selector(openAlertButtonTapped), for: .touchUpInside)
        
        
    }
    @objc private func openAlertButtonTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            print("Open Camera")
        }))
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alert, animated: true)
    }
    @objc private func openGalery() {
        var configuretor = PHPickerConfiguration(photoLibrary: .shared())
        configuretor.filter = .images
        configuretor.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuretor)
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension DefaultAddNewFilmView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.addImageView.image = image
                    }
                }
            }
        }
        dismiss(animated: true)
    }
    
    
}

