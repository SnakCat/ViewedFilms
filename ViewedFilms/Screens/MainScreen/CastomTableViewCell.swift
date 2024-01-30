import UIKit

class CastomTableViewCell: UITableViewCell {
    
    //MARK: - propertis
    private let contenerView = UIView()
    private let movieImageView = UIImageView()
    private let nameLabel = UILabel()
    private let gradeLabel = UILabel()
    private let infoView = UIView()
    private let defaultRetingLabel = UILabel()
    
    //MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewCell()
        setupConstreints()
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - configure Entity
    func configureEntity(movie: Movie) {
        if let imageData = movie.imageFilm, let movieImage = UIImage(data: imageData) {
            self.movieImageView.image = movieImage
        } else {
            self.movieImageView.image = UIImage(named: "default_image")
        }
        nameLabel.text = movie.filmName
        gradeLabel.text = movie.reating
    }
    
    //MARK: - add subView Cell
    private func addSubViewCell() {
        contentView.addSubview(contenerView)
        contenerView.addSubviews(movieImageView, infoView)
        infoView.addSubviews(nameLabel, gradeLabel, defaultRetingLabel)
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        contenerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contenerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            contenerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            contenerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            contenerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contenerView.heightAnchor.constraint(equalToConstant: 212)
        ])
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contenerView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor),
            movieImageView.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.57)
        ])
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: contenerView.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
            infoView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor)
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 34),
            nameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -15)
        ])
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradeLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50),
            gradeLabel.trailingAnchor.constraint(equalTo: infoView.centerXAnchor)
        ])
        defaultRetingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            defaultRetingLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50),
            defaultRetingLabel.leadingAnchor.constraint(equalTo: gradeLabel.trailingAnchor, constant: 2.5),
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        contentView.backgroundColor = .backgroundMainView
        contenerView.backgroundColor = .white
        contenerView.layer.masksToBounds = true
        contenerView.layer.cornerRadius = 8
        contenerView.layer.shadowRadius = 16
        contenerView.layer.shadowOpacity = 0.10
        
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = .zero
        nameLabel.font = UIFont(name: "manrope-regular", size: 18)
        
        gradeLabel.textAlignment = .center
        gradeLabel.font = UIFont(name: "manrope-semibold", size: 18)
        
        defaultRetingLabel.font = UIFont(name: "manrope-thin", size: 18)
        defaultRetingLabel.text = "/10"
    }
}
