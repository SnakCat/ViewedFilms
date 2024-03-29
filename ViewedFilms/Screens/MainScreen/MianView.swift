import UIKit

final class DefaultMainView: UIViewController {
    
    //MARK: - propertis
    var viewModal: MainViewModal!
    private let tableView = UITableView()
    private var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstreints()
        setupUI()
        configBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModal.loadMovies()
    }
    
    //MARK: - data binbing
    private func configBinding() {
        viewModal.setupMovie = { [ weak self ] movie in
            self?.movies = movie
        }
        viewModal.inputAddNewFilmView = { [ weak self ] addNewView in
            self?.navigationController?.pushViewController(addNewView, animated: true)
        }
    }
    
    //MARK: - setup tableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CastomTableViewCell.self, forCellReuseIdentifier: "CastomTableViewCell")
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        tableView.backgroundColor = .backgroundMainView
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { [ weak self ] _ in
            self?.transitionAddNewFilm()
        }))
        tableView.separatorStyle = .none
        navigationItem.backButtonTitle = ""
    }
    private func transitionAddNewFilm() {
        viewModal.bildAddNewFilmViewController()
    }
}

    //MARK: - extension tableView
extension DefaultMainView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastomTableViewCell", for: indexPath) as? CastomTableViewCell {
            let movie = movies[indexPath.row]
            cell.configureEntity(movie: movie)
            return cell
        }
        return UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        if editingStyle == .delete {
            let alertDelete = UIAlertController(title: "Delete", message: nil, preferredStyle: .alert)
            alertDelete.addAction(UIAlertAction(title: "Clouse", style: .default, handler: nil))
            alertDelete.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                _ = CoreDataManager.instance.deleteFilm(movie)
                self.viewModal.loadMovies()
            }))
            present(alertDelete, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let InfoFilm = FullInfoFilmView()
        let movie = movies[indexPath.row]
        InfoFilm.configure(movie: movie)
        navigationController?.pushViewController(InfoFilm, animated: true)
    }
}
