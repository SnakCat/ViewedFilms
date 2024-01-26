import UIKit
import PhotosUI

final class DefaultAddNewFilmView: UIViewController {
    
    //MARK: - properties
    var viewModel: AddNewFilmViewModel!
    
    private let addImageView = UIImageView()
    private let openAlertButton = UIButton()
    private let nameStackView = UIStackView()
    private let titleNameLabel = UILabel()
    private var nameLabel = UILabel()
    private let changeNameButton = UIButton()
    private let ratingStackView = UIStackView()
    private let titleRatingLabel = UILabel()
    private var ratingLabel = UILabel()
    private let changeRatingButton = UIButton()
    private let releaseStackView = UIStackView()
    private let titleReleaseLable = UILabel()
    private var releaseLabel = UILabel()
    private let changeReleaseButton = UIButton()
    private let youtubeStackView = UIStackView()
    private let titleYoutubeLabel = UILabel()
    private var youtubeLabel = UILabel()
    private let changeYoutubeButton = UIButton()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupConstreints()
        setupUI()
        configBainding()
    }
    private func configBainding() {
        viewModel.setupAlert = { [weak self ] alert in
            self?.present(alert, animated: true)
        }
        viewModel.setupPicker = { [weak self ] picker in
            picker.delegate = self
            self?.present(picker, animated: true)
        }
        viewModel.transitionNameView = { [ weak self ] filmNameView in
            self?.navigationController?.pushViewController(filmNameView, animated: true)
            filmNameView.viewModel.saveNameClosure = { [ weak self ] name in
                self?.nameLabel.text = name
                print("123")
            }
        }
        viewModel.transitionRatingView = { [ weak self ] RatingDataPikerView in
            self?.navigationController?.pushViewController(RatingDataPikerView, animated: true)
        }
        viewModel.transitionReleaseView = { [ weak self ] ReleaseDataPickerView in
            self?.navigationController?.pushViewController(ReleaseDataPickerView, animated: true)
        }
        viewModel.transitionYoutubeView = { [ weak self ] YoutubeView in
            self?.navigationController?.pushViewController(YoutubeView, animated: true)

        }
    }

    
    //MARK: - add Sub View
    private func addSubView() {
        view.addSubviews(addImageView, openAlertButton, nameStackView, ratingStackView, releaseStackView, youtubeStackView, descriptionLabel, descriptionTextView)
        nameStackView.addArrangedSubviews(titleNameLabel, nameLabel, changeNameButton)
        ratingStackView.addArrangedSubviews(titleRatingLabel, ratingLabel, changeRatingButton)
        releaseStackView.addArrangedSubviews(titleReleaseLable, releaseLabel, changeReleaseButton)
        youtubeStackView.addArrangedSubviews(titleYoutubeLabel, youtubeLabel, changeYoutubeButton)
        
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
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameStackView.topAnchor.constraint(equalTo: addImageView.bottomAnchor, constant: 32),
            nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameStackView.widthAnchor.constraint(equalToConstant: 125),
            nameStackView.heightAnchor.constraint(equalToConstant: 84)
        ])
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingStackView.topAnchor.constraint(equalTo: addImageView.bottomAnchor, constant: 32),
            ratingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ratingStackView.widthAnchor.constraint(equalToConstant: 125),
            ratingStackView.heightAnchor.constraint(equalToConstant: 84)
        ])
        releaseStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32),
            releaseStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            releaseStackView.widthAnchor.constraint(equalToConstant: 125),
            releaseStackView.heightAnchor.constraint(equalToConstant: 84)
        ])
        youtubeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            youtubeStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 32),
            youtubeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            youtubeStackView.widthAnchor.constraint(equalToConstant: 125),
            youtubeStackView.heightAnchor.constraint(equalToConstant: 84)
        ])
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: releaseStackView.bottomAnchor, constant: 36),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47)
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        navigationItem.backButtonTitle = ""
        title = "Add new"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save)
        
        addImageView.backgroundColor = .backgroundAdd
        addImageView.layer.cornerRadius = 75
        addImageView.layer.masksToBounds = true
        
        openAlertButton.backgroundColor = .clear
        openAlertButton.setImage(UIImage(named: "image 3"), for: .normal)
        openAlertButton.addTarget(self, action: #selector(openAlertButtonTapped), for: .touchUpInside)
        
        nameStackView.axis = .vertical
        nameStackView.alignment = .center
        titleNameLabel.text = "Name"
        nameLabel.text = " - "
        changeNameButton.setTitle("Change", for: .normal)
        changeNameButton.setTitleColor(.systemBlue, for: .normal)
        changeNameButton.addTarget(self, action: #selector(changeNameButtonTapped), for: .touchUpInside)
        
        ratingStackView.axis = .vertical
        ratingStackView.alignment = .center
        titleRatingLabel.text = "Your Rating"
        ratingLabel.text = " - "
        changeRatingButton.setTitle("Change", for: .normal)
        changeRatingButton.setTitleColor(.systemBlue, for: .normal)
        changeRatingButton.addTarget(self, action: #selector(changeRatingButtonTapped), for: .touchUpInside)
        
        releaseStackView.axis = .vertical
        releaseStackView.alignment = .center
        titleReleaseLable.text = "Release Date"
        releaseLabel.text = " - "
        changeReleaseButton.setTitle("Change", for: .normal)
        changeReleaseButton.setTitleColor(.systemBlue, for: .normal)
        changeReleaseButton.addTarget(self, action: #selector(changeReleaseButtonTapped), for: .touchUpInside)
        
        youtubeStackView.axis = .vertical
        youtubeStackView.alignment = .center
        titleYoutubeLabel.text = "YouTube Link"
        youtubeLabel.text = " - "
        changeYoutubeButton.setTitle("Change", for: .normal)
        changeYoutubeButton.setTitleColor(.systemBlue, for: .normal)
        changeYoutubeButton.addTarget(self, action: #selector(changeYoutubeButtonTapped), for: .touchUpInside)
        
        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center
        
    }
    @objc private func changeRatingButtonTapped() {
        viewModel.changeRatingView()
    }
    @objc private func changeReleaseButtonTapped() {
        viewModel.changeReleaseView()
    }
    @objc private func changeNameButtonTapped() {
        viewModel.changeNameView()
    }
    @objc private func changeYoutubeButtonTapped() {
        viewModel.changeYoutubeView()
    }
    
    //MARK: - open Alert
    @objc private func openAlertButtonTapped() {
        viewModel?.openAlertButtonTapped()
    }
    
    //MARK: - open Galery
    @objc private func openGalery() {
        viewModel?.openGalery()
    }
    
    func setupImage(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.addImageView.image = image
                self.openAlertButton.setImage(UIImage(), for: .normal)
            }
        }
    }
}

    //MARK: - extension picker
extension DefaultAddNewFilmView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                self.setupImage(image: image as? UIImage)
            }
        }
        dismiss(animated: true)
    }
}

