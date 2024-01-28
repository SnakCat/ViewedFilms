import UIKit
import WebKit

final class FullInfoFilmView: UIViewController {
    //MARK: - propertis
    var viewModel: FullInfoFilmViewModel!
    private let imageViewMovie = UIImageView()
    private let infoView = UIView()
    private let nameLabel = UILabel()
    private let retingLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let trailerView = WKWebView()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubeviews()
        setupConstreints()
        setupUI()

    }
  
    //MARK: - add SubView
    private func addSubeviews() {
        view.addSubviews(imageViewMovie, infoView)
        infoView.addSubviews(trailerView, nameLabel, retingLabel, descriptionTextView)
    }
    //MARK: - constreints
    private func setupConstreints() {
        imageViewMovie.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewMovie.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewMovie.heightAnchor.constraint(equalToConstant: 296)
        ])
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 257),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 29),
            nameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19),
            nameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -18),
            nameLabel.heightAnchor.constraint(equalToConstant: 65)
        ])
        retingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            retingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 14),
            retingLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19),
            retingLabel.heightAnchor.constraint(equalToConstant: 24),
            retingLabel.widthAnchor.constraint(equalToConstant: 124)
        ])
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: retingLabel.bottomAnchor, constant: 13),
            descriptionTextView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19),
            descriptionTextView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -19),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 138)
        ])
        trailerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailerView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 18),
            trailerView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -19),
            trailerView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -52),
            trailerView.heightAnchor.constraint(equalToConstant: 196)
        ])
    }
    //MARK: - UI
    private func setupUI() {
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 16
        nameLabel.numberOfLines = .zero
        nameLabel.font = UIFont(name: "manrope-regular", size: 18)
        imageViewMovie.contentMode = .scaleToFill
        
    }
    
    //MARK: - configure
    func configure(movie: Movie) {
        if let imageData = movie.imageFilm, let movieImage = UIImage(data: imageData) {
            self.imageViewMovie.image = movieImage
        } else {
            self.imageViewMovie.image = UIImage(named: "default_image")
        }
        nameLabel.text = movie.filmName
        retingLabel.text = movie.reating
        descriptionTextView.text = movie.descriptionFilm
        if let url = URL(string: movie.youtubeLink ?? "") {
            trailerView.load(URLRequest(url: url))
        }
    }
}
